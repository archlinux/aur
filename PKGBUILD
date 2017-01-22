# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='backdrop-randomizer'
pkgver=2.30
pkgrel=1
pkgdesc='Companion for xfdesktop which randomly cycles through wallpapers without repeating them until all have been displayed once.'
arch=('any')
url='https://github.com/graysky2/backdrop-randomizer'
license=('MIT')
depends=('xfdesktop')
optdepends=('systemd: or optional scheduling of timed backdrop change'
'cron: for optional scheduling of timed backdrop change')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('5d8ecc1df461ec34d57944754af3e8f9a0f535a4ffc53717c857a92005913c09')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
