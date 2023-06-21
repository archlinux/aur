# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.7.0
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://xnvme.io/"
license=('APACHE')
depends=(python-pyelftools libaio libutil-linux numactl python3 liburing openssl nasm)
makedepends=(meson ninja cunit ncurses)
source=("https://github.com/OpenMPDK/xNVMe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('1c3012b17979c782e4080a1eef83c5ad')

build() {
	arch-meson "$pkgname-$pkgver" build -Dwith-libvfn=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
