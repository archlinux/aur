# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=backdrop-randomizer
pkgver=2.33
pkgrel=1
pkgdesc="Randomly cycles through wallpapers without repeating them until all have been displayed once"
arch=(any)
url='https://github.com/graysky2/backdrop-randomizer'
license=(MIT)
depends=(xfdesktop)
optdepends=('systemd: or optional scheduling of timed backdrop change'
'cron: for optional scheduling of timed backdrop change')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('3b3484c6804befa759d98b16a1698f3cd0cfb164c1488a2b51c1f64bd043afb86627de009cfb7157e168dd7cda8a6badfc6b1ff92ae676283abbc3654fa673c8')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
