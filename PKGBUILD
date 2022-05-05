# Maintainer: graysky <therealgraysky AT protonmail DOT com>

pkgname=backdrop-randomizer
pkgver=2.36
pkgrel=1
pkgdesc="Randomly cycles through wallpapers without repeating them until all have been displayed once"
arch=(any)
url='https://github.com/graysky2/backdrop-randomizer'
license=(MIT)
depends=(xfdesktop xorg-xset)
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('298b768e6498bfecf6c0ee0101ab4285684facc1996842caab021470361d27a20f66f808e0fd4371e4549e1da4d74ca5b6a170064bc6c80c85614422fda6c747')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
