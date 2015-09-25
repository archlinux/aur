# Maintainer: Vincent Hourdin <aur at vinvin dot tf>
pkgname=ser-player
pkgver=v1.3.0.r0.g615e4db
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
  cd "${srcdir}/${pkgname}"
  qmake-qt5 ser-player.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bin/ser-player "$pkgdir/usr/bin/ser_player"
}

# vim:set ts=2 sw=2 et:
