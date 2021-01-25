# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15render
pkgver=1.3
pkgrel=1
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15render"
license=('GPL')
depends=('libg15')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2)
sha512sums=('d4f6188d774445139accc5cf6e3d01fa3091b8d5b65c00671274d19d6185a96ed064af04e8743781ed716d6679a3514f9d30656bc829e6e7c62b33b68be70558')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
