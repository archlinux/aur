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
b2sums=('432e2b0f5aa60413445ca1d3fa00c9f2adef94fc22d599de2c04fe636c1c3e978143d43815844deb2849150612e72dbaf2fb706830881214235cc78cbdb18cd3')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
