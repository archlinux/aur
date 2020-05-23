# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=backdrop-randomizer
pkgver=2.31
pkgrel=1
pkgdesc="Companion for xfdesktop which randomly cycles through wallpapers without repeating them until all have been displayed once."
arch=(any)
url='https://github.com/graysky2/backdrop-randomizer'
license=(MIT)
depends=(xfdesktop)
optdepends=('systemd: or optional scheduling of timed backdrop change'
'cron: for optional scheduling of timed backdrop change')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
install=readme.install
sha256sums=('acd37eead7bf741f4c42ee8133c9345d9e7939bd8b5a83c9149cd2eed83714b8')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
