# Maintainer: Nima Askarian <nimaaskarian.work@outlook.com>
pkgname=potato-c
pkgver=0.5.1
pkgrel=3
_gitname=potato-c
pkgdesc="A featureful, modular and fast pomodoro timer with server-client structure, written in C."
url="https://github.com/nimaaskarian/${_gitname}"

provides=(potctl potd potui)
makedepends=(ncurses)
arch=('x86_64')
license=('GPL3')
optdepends=(
  'libnotify: sending notifications on event'
  # AUR
  'herbe-git: sending notifications on event'
)

source=(
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/${_gitname}/archive/refs/tags/${pkgver}.zip"
)

md5sums=('6a3dc277fe997b0553b8e1ad80b9dac3')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
