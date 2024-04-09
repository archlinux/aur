# Maintainer: Nima Askarian <nimaaskarian.work@outlook.com>
pkgname=potato-c
pkgver=0.6.3
pkgrel=1
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

md5sums=('34a894cd0727cb596c4e1ec91ca00527')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
