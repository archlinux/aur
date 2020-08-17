# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=0.9.0
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('GPL3')
depends=(qt5-base qt5-multimedia)
source=("https://github.com/Anchorm/SoulAnchor/archive/$pkgname-$pkgver.tar.gz")
sha256sums=("8f16d8a9c9e4ce70bdbd0d68c08f0a9116ebea74cf7b874a83678d6301f5001a")

build() {
    cd "SoulAnchor-$pkgname-$pkgver"
    qmake
    make
}

package() {
	cd "SoulAnchor-$pkgname-$pkgver"
	cp -a --no-preserve=ownership install/usr/ "$pkgdir/"
	install -Dm644 -t "$pkgdir/usr/share/doc/soulanchor/" MOD README.md
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/soulanchor/LICENSE"
}
