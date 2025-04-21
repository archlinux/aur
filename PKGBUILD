# Maintainer: El Bachir <bachiralfa@gmail.com>

pkgname=sxwm
pkgver=1.0.0
pkgrel=1
pkgdesc="Tiling window managers dont have to be difficult"
arch=('i686' 'x86_64')
url="https://github.com/uint23/sxwm"
license=('MIT')
depends=('libx11' 'libxinerama')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uint23/sxwm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a87e1481ec82013d0ef5990dbe5fa2c9dc46387e388d2fe2166965f144e03167')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make LDFLAGS="-lX11 -lXinerama"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 sxwm "$pkgdir/usr/bin/sxwm"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
