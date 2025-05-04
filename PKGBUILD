# Maintainer: El Bachir <bachiralfa@gmail.com>

pkgname=sxwm
pkgver=1.5
pkgrel=2
pkgdesc="Tiling window managers don't have to be difficult"
arch=('i686' 'x86_64')
url="https://github.com/uint23/sxwm"
license=('MIT')
depends=('libx11' 'libxinerama' 'libxcursor')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uint23/sxwm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5443ae3955c50527c22253f20e1f6d5c96e6cc842ff7e3370d0f6920167148b7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make LDFLAGS="-lX11 -lXinerama -lXcursor"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 sxwm "$pkgdir/usr/bin/sxwm"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cp default_sxrc $HOME/.config/sxwmrc
}
