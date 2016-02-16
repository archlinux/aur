# Maintainer: Jens Kuske <jenskuske@gmail.com>
# Contributor: smotocel69 <smotocel69@gmail.com>
pkgname=libvdpau-sunxi
pkgver=0.4
pkgrel=1
pkgdesc="VDPAU driver for Allwinner sunxi SoCs"
arch=('armv7h')
url="https://github.com/linux-sunxi/libvdpau-sunxi"
license=('LGPL')
depends=('libx11')
makedepends=('libvdpau')
source=("https://github.com/linux-sunxi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5139b007d9075654cfb47ced29f4e335302b7ede9ea9544524aa2232c357b08a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
