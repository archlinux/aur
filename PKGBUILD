# Maintainer: El Bachir <bachiralfa@gmail.com>

pkgname=sxwm
pkgver=1.8
pkgrel=1
pkgdesc="Tiling window managers don't have to be difficult"
arch=('i686' 'x86_64')
url="https://github.com/uint23/sxwm"
license=('MIT')
depends=('libx11' 'libxinerama' 'libxcursor')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uint23/sxwm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60ae72f4417426194da722e9482076381f6664e27b95f519791b642516be9423')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make LDFLAGS="-lX11 -lXinerama -lXcursor"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 sxwm "$pkgdir/usr/bin/sxwm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 default_sxwmrc "$pkgdir/usr/share/doc/$pkgname/sxwmrc"
	install -Dm644 docs/sxwm.desktop "$pkgdir/usr/share/xsessions/sxwm.desktop"
}
