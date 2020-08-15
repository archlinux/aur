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
Name=SoulAnchor

build() {
    cd "SoulAnchor-$pkgname-$pkgver"
    qmake
    make -j$(nproc)
}

package() {
	cd "SoulAnchor-$pkgname-$pkgver/install"
	cp -a --no-preserve=ownership usr/ "$pkgdir/"
	install -Dm644 ../README.md "$pkgdir/usr/share/doc/soulanchor/README.md"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/doc/soulanchor/LICENSE"
	install -Dm644 ../COPYING "$pkgdir/usr/share/doc/soulanchor/COPYING"
	install -Dm644 ../MOD "$pkgdir/usr/share/doc/soulanchor/MOD"
}
