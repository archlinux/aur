# Maintainer: Nomorsad <nomorsad.poubelle@gmail.com>
pkgname=ltwheelconf-git
pkgver=0.2.7
pkgrel=2
pkgdesc="Setup your Logitech wheel under Linux"
arch=('x86_64' 'i686')
url="https://github.com/thk/LTWheelConf"
license=('GPL')
depends=('libusb')
makedepends=('git' 'make')
sha1sums=('SKIP')

source=("git+https://github.com/thk/LTWheelConf.git")

pkgver() {
  cd LTWheelConf
  perl -ne 'print $1 if /^#define VERSION "(.*)"$/' main.c
}

build() {
  cd LTWheelConf

  make

}

package() {
  cd LTWheelConf
  install -D -m755 "ltwheelconf" "$pkgdir/usr/bin/ltwheelconf"
}

# vim:set ts=2 sw=2 et:

