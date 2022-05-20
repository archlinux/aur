# Maintainer: Karl Bonde Torp <k.torp@samsung.com>
pkgname=xnvme
pkgver=0.3.0
pkgrel=1
pkgdesc="Cross-platform libraries and tools for NVMe devices"
arch=('x86_64')
url="https://xnvme.io/"
license=('APACHE')
depends=(python-pyelftools libaio libutil-linux numactl python3)
makedepends=(meson ninja cunit ncurses)
source=("https://github.com/OpenMPDK/xNVMe/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('038b0928f3d892750bcf91964ef4ec11')

build() {
	arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
