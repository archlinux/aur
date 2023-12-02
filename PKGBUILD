# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=potato-c
pkgver=v0.2
pkgrel=1
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

md5sums=('6ccc41f79173aca329b3a40c79fc7ae6')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
