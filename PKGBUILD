# Maintainer: vimacs <https://vimacs.lcpu.club>

pkgname=xdanmaku
pkgver=1.0
pkgrel=1
pkgdesc='client for tuna/gdanmaku-server implemented in C for X11'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/mytbk/xdanmaku'
license=('Apache')
depends=('json-c' 'libxft' 'curl')
source=("https://github.com/mytbk/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('30428056eb32e02bc54fcb4177b6c05e549a32e5153a2c683f6204e5d33ed5dc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m 0755 xdanmaku_main "$pkgdir/usr/bin/xdanmaku"
}

