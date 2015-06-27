# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

_name=tty-solitaire
pkgname="${_name}-git"
pkgver=248.7b127c9
pkgrel=1
pkgdesc='An ncurses-based Klondike solitaire clone'
arch=('i686' 'x86_64')
url='https://github.com/mpereira/tty-solitaire'
license=('MIT')
makedepends=('git')
depends=('ncurses')
source=("${_name}"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_name}"
  make
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
