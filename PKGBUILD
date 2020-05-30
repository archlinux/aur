# Maintainer: X0rg

_realname=CPU-X
pkgname=cpu-x
pkgver=4.0.0
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64')
url="http://X0rg.github.io/CPU-X/"
license=('GPL3')
depends=('gtk3' 'ncurses' 'libcpuid' 'pciutils' 'procps-ng')
makedepends=('cmake' 'ninja' 'nasm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/X0rg/CPU-X/archive/v$pkgver.tar.gz")
sha512sums=('838ed092c81e9e295e08d4df564dd9af3b25d925ea7fc5cdfe4e831300a0c53e43333305962aeb783ab17fedf3a5786caf93e5a647f470af23eac8b156a167b7')

build() {
	cmake -S "$_realname-$pkgver" -B build -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
