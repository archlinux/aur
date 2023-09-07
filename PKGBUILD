# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.7.1
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://xnvme.io/"
license=('APACHE')
depends=(python-pyelftools libaio libutil-linux numactl python3 liburing openssl nasm)
makedepends=(meson ninja cunit ncurses)
source=("https://github.com/OpenMPDK/xNVMe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('07d79ea015e90a420a7b3c1474e36ad4')

build() {
	arch-meson "$pkgname-$pkgver" build -Dwith-libvfn=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
