# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=liri-terminal
pkgver=0.0.0.20170118
_commit=e6b33d1700f454e2c50f74756aa2579fc4994996
pkgrel=1
pkgdesc="Terminal for Liri"
arch=("i686" "x86_64")
url="https://github.com/lirios/terminal"
license=("GPL")
depends=("fluid" "vibe" "dconf")
makedepends=("git" "extra-cmake-modules")
replaces=('papyros-terminal')
source=("git+https://github.com/lirios/terminal.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "$srcdir/terminal" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
