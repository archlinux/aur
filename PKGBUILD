# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='backdrop-randomizer'
pkgver=2.27
pkgrel=1
pkgdesc='Companion for xfdesktop which randomly cycles through wallpapers without repeating them until all have been displayed once.'
arch=('any')
url='https://github.com/graysky2/backdrop-randomizer'
license=('MIT')
depends=('xfdesktop')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('6d7e086e7421ce4ccec42d32d917312a02b2ee11f0bbaf73829eab81825fcbc7')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
