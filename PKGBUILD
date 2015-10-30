#  Maintainer: maz-1 <ohmygod19993 at gmail dot com>

_pkgname=libsoxconvolver
pkgname=$_pkgname-git
pkgver=1.de7fa7b
pkgrel=1
pkgdesc="A DFT-based FIR filtering library based on SoX"
arch=('i686' 'x86_64')
license=('LGPL')
depends=()
makedepends=('git')
provides=('libsoxrconvolver')
conflicts=('libsoxrconvolver')
url="https://github.com/nu774/libsoxconvolver"
source=("$_pkgname::git+https://github.com/nu774/libsoxconvolver.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd $_pkgname
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}

