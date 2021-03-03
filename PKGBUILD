# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15render
pkgver=3.0
pkgrel=1
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15render"
license=('GPL')
depends=('libg15')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('5ee541a6d5b9f48642f038bca496e918cfe16febae125648b8a387667cde13f914a2ac293dff56d99ccbf337d7c65a52d3b7feda1788b47ecdbb756d870259b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
