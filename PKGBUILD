# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://github.com/OpenMPDK/xNVMe"
license=('APACHE')
depends=(python-pyelftools libaio libutil-linux numactl python3)
makedepends=(git meson ninja cunit ncurses)
source=("https://github.com/OpenMPDK/xNVMe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
