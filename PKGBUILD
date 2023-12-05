# Maintainer: Nima Askarian <nimaas1400@gmail.com>
pkgname=potato-c
pkgver=0.3.2
pkgrel=1
_gitname=potato-c
pkgdesc="A featureful, modular and fast pomodoro timer with server-client structure, written in C."
url="https://github.com/nimaaskarian/${_gitname}"

provides=(potctl potd potui)
makedepends=(git ncurses)
arch=('x86_64')
license=('GPL3')
optdepends=('libnotify: sending notifications on event')

source=(
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/${_gitname}/archive/refs/tags/${pkgver}.zip"
)

md5sums=('642ab5e368a173b46f73b58337048894')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
