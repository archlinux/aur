# Maintainer: Milk Brewster <milkii@freenode.irc>
pkgname=beast-git
pkgver=r9082.ddddc1e05
pkgrel=1
epoch=
pkgdesc="Digital synthesizer and music creation system (in development)."
arch=('x86_64')
url="https://github.com/tim-janik/beast"
license=('LGPL')
groups=()
depends=()
makedepends=('gcc' 'libgnomecanvas' 'libvorbis' 'flac' 'libmad' 'npm' 'fluidsynth' 'python-pandocfilters')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/tim-janik/beast")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "beast"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "beast"
  make default prefix=/usr
}

build() {
  cd "beast"
	make
}

check() {
  cd "beast"
	# make  check
}

package() {
  cd "beast"
	make DESTDIR="$pkgdir/" install
}
