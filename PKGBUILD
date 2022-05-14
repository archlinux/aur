# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

pkgname=libg15render
pkgver=3.0.4
pkgrel=1
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15render"
license=('GPL')
depends=('libg15')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('f11470b4c8709b7cab8747d8eca4d55ddf88f6dd0a46f11de78612d6070c8b5ea7188ec1ea0236edbb0e5904e6dffd7c75831d5e00564b3cebf8b9dc58b0100e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
