# Maintainer: vimacs <https://vimacs.lcpu.club>

pkgname=xdanmaku
pkgver=2.1
pkgrel=1
pkgdesc='client for tuna/gdanmaku-server implemented in C for X11'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/mytbk/xdanmaku'
license=('Apache')
depends=('json-c' 'libxft' 'libxinerama' 'curl')
source=("https://github.com/mytbk/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('709c8b30ee3f69333910cadccfeaf0b50c09700176209d1ba1c6995d3f34265f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m 0755 xdanmaku_main "$pkgdir/usr/bin/xdanmaku"
}

