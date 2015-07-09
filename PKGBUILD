# Maintainer: Jens Kuske <jenskuske@gmail.com>
# Contributor: smotocel69 <smotocel69@gmail.com>
pkgname=libvdpau-sunxi
pkgver=0.3
pkgrel=1
pkgdesc="VDPAU driver for Allwinner sunxi SoCs"
arch=('armv7h')
url="https://github.com/linux-sunxi/libvdpau-sunxi"
license=('LGPL')
depends=('libx11')
makedepends=('libvdpau')
source=("https://github.com/linux-sunxi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8a29b2b5394e9ad5f461af48cea780d3cb183bfc80399e58a27b632c1a9d5bab')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
