# Maintainer: Jordan Rudess <jrudess@gmail.com>
pkgname=slang-verilog
pkgver=7.0
pkgrel=1
epoch=
pkgdesc="SystemVerilog Language Services"
arch=('x86_64')
url="https://github.com/MikePopoloski/slang"
license=('MIT')
groups=()
depends=('fmt' 'catch2' 'boost' 'mimalloc')
makedepends=('python' 'cmake' 'gcc' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MikePopoloski/slang/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('66a9c1480781595c1c22fe9b9ee205c1eb621c129ed62b22e487bad41f43860c')
validpgpkeys=()

prepare() {
	mkdir -p "$srcdir/slang-$pkgver/build"
}

build() {
	cd "$srcdir/slang-$pkgver/build"
	cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=True ..
	make VERBOSE=1
}

package() {
	cd "$srcdir/slang-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
