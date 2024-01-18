# Maintainer: Jeremy Baxter <jtbx@disroot.org>

pkgname=callisto
pkgver=0.1.0
pkgrel=2
pkgdesc='standalone scripting platform for Lua 5.4'
arch=('x86_64')
url='https://github.com/jtbx/callisto'
depends=(libbsd)
license=('GPL')
options=('!emptydirs')
source=("https://github.com/jtbx/callisto/releases/download/v$pkgver/callisto-$pkgver.tgz")
sha256sums=('825aa7717e21ebe443b0a71a5961c6c144a82e6be09b38d91e494008f5a73f3f')

build() {
	cd "$pkgname-$pkgver"
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
