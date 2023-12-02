# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=potato-c
pkgver=v0.1
pkgrel=2
_gitname=potato-c
pkgdesc="A featureful, modular and lightweight pomodoro timer with server-client structure, written in C."

provides=(potctl potd potui)
makedepends=(git make ncurses)
arch=('x86_64')
license=('GPL3')
optdepends=('libnotify: sending notifications on event')

source=(
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/potato-c/archive/refs/tags/${pkgver}.zip"
)

md5sums=('83eb2e6603f11c969b2f81d4560abad3')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
