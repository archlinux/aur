# Maintainer: François Freitag <mail+aur@franek.fr>
pkgname=g810-led
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux led controller for the Logitech G810, G410, G610 and G910 keyboards"
arch=('i686' 'x86_64')
url="https://github.com/MatMoul/g810-led/"
license=('GPL3')
depends=('hidapi')
makedepends=('git' 'gcc' 'make')
optdepends=('libusb: alternative USB communication library (slower, more stable)')
backup=("etc/$pkgname/profile" "etc/$pkgname/reboot")
install=$pkgname.install
source=("https://github.com/MatMoul/$pkgname/archive/master.zip")
md5sums=('a3c8874ce8b5ec20c75ac76ad0bf0700')

build() {
  cd "$pkgname-master"
  make
  # To build with libusb, run:
  # make LIB=libusb
}

package() {
  cd "$pkgname-master"
  make DESTDIR="$pkgdir/" setup
}
