pkgname=lazyverilog
pkgver=2.0.0
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

sha256sums=('4a1d0486c364c867792f599348ae0508ab4174cdf47cd936056f64c8231d3c0b')
