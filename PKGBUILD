# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=nausea-git
epoch=1
pkgver=0.113.e144a01
pkgrel=1
pkgdesc="curses audio visualizer"
arch=('i686' 'x86_64')
url="http://git.2f30.org/nausea/"
license=('BSD')
makedepends=('git')
depends=('ncurses' 'fftw')
conflicts=('nausea')

source=(
  'git+git://git.2f30.org/nausea'
)

sha256sums=(
  'SKIP'
)
_gitname="nausea"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
