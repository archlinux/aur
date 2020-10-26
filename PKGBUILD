# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=backdrop-randomizer
pkgver=2.35
pkgrel=1
pkgdesc="Randomly cycles through wallpapers without repeating them until all have been displayed once"
arch=(any)
url='https://github.com/graysky2/backdrop-randomizer'
license=(MIT)
depends=(xfdesktop)
optdepends=('systemd: or optional scheduling of timed backdrop change'
'cron: for optional scheduling of timed backdrop change')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('a09f2931b22fd2256f6113b151c8aca900436731ea8c99762e9792ff9d9fca8862450ba51af50b2356b1f5ddba2e139a12ebe8e8b45e5190745bce2f78d8d6d4')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
