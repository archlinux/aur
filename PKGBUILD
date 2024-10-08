# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ivaylo Bachvarov <ISBachvarov21@codingburgas.bg>
pkgname=rune-cpp-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A C++ framework for developing REST APIs with a focus on simplicity and speed."
arch=(x86_64 i686)
url="https://github.com/ISBachvarov21/Rune"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=(rune-cpp)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+$url.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
  cd $pkgname
  mkdir build
  cmake -S . -B build
  cmake --build build
}

package() {
  cd $pkgname
	sudo cmake --install build --prefix /usr
}
