# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: onestep_ua <onestep at ukr dot net>

_pkgname=libg15
pkgname=$_pkgname-git
pkgver=3.0.8.r1
pkgrel=1
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="https://gitlab.com/menelkir/$_pkgname"
license=('GPL')
depends=('libusb-compat')
conflicts=('libg15')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
