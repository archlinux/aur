# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=systemd-xorg-launch-helper-git
pkgver=28
pkgrel=1
pkgdesc="A wrapper in C to make X.Org function as a proper systemd unit"
arch=('i686' 'x86_64')
url="https://github.com/sofar/xorg-launch-helper"
license=('GPL2')
depends=('systemd' 'xorg-server')
makedepends=('git')
provides=('xorg-launch-helper')
conflicts=('xorg-launch-helper')
source=('git+https://github.com/sofar/xorg-launch-helper.git')
sha256sums=('SKIP')

pkgver() {
  cd xorg-launch-helper

  git rev-list --count HEAD
}

build () {
  cd xorg-launch-helper

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd xorg-launch-helper

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
