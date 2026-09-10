pkgname=lazyverilog
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="A fast, practical SystemVerilog LSP for RTL coding."
arch=("any")
url="https://github.com/lazyverilog/LazyVerilog"
license=("MIT")
groups=()
makedepends=("boost" "cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lazyverilog/LazyVerilog/archive/v${pkgver}.tar.gz")
noextract=()

validpgpkeys=()

build() {
	cd "LazyVerilog"
	mkdir -p build
	cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j$(nproc) --target lazyverilog-lsp
}

package() {
	cd "LazyVerilog/build"
	install -Dm755 lazyverilog-lsp "$pkgdir/usr/bin/lazyverilog-lsp"
}

sha256sums=('c35e4b0330a6c1a447577b07159d6b619924bd6a7bea22c73ac4a1275d8ddf71')
