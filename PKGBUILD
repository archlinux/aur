# Maintainer: Michael Vale <mike@vale.net.au>
_pkgname=samplebrain
pkgname=$_pkgname-git
pkgver=0.18.r6.g6bc1cbe
pkgrel=1
epoch=
pkgdesc="A custom sample mashing app designed by Aphex Twin."
arch=('x86_64')
url="https://gitlab.com/then-try-this/samplebrain"
license=('GPL')
groups=()
depends=('libsndfile' 'portaudio' 'liblo' 'fftw' 'qt5-base')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("samplebrain-git::git+https://gitlab.com/then-try-this/samplebrain.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_release//g'
}

build() {
	cd "$pkgname"
	qmake-qt5
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make INSTALL_ROOT="$pkgdir/" install
}

