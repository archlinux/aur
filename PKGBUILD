# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=ser-player
pkgver=v1.2.0.r8.gb658019
pkgrel=1
pkgdesc="A simple SER files player, a file format used in astronomy."
url="https://github.com/cgarry/ser-player"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('qt5-base')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git+https://github.com/cgarry/ser-player.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}/ser_player"
  qmake-qt5 ser_player.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bin/ser-player "$pkgdir/usr/bin/ser_player"
}

# vim:set ts=2 sw=2 et:
