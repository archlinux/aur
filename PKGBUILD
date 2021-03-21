# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15render
pkgver=3.0.2
pkgrel=1
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15render"
license=('GPL')
depends=('libg15')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('cac71440fe2820eea5cbf5bc283ccb79730f53e840b326d1aa6f8f6836e61dd97fa8994d1c8f84276b86927f66fad9d9a622eb4a70c4ba620b3bc0f09b956daa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
