# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15render
pkgver=1.3.1
pkgrel=1
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15render"
license=('GPL')
depends=('libg15')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('19ec652c71393fb5d19e8447ced492c17d84d2086cbbdb9c96ef0247a0f93f3f9042f21445e61e21fcef1ef0efa39d14b96b48fe4bd0624ed7675ed43318cc6e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
