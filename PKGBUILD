# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='backdrop-randomizer'
pkgver=2.26
pkgrel=1
pkgdesc='Companion for xfdesktop which randomly cycles through wallpapers without repeating them until all have been displayed once.'
arch=('any')
url='https://github.com/graysky2/backdrop-randomizer'
license=('MIT')
depends=('xfdesktop')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('85bea11b215439d6fae2b5e780725d451a475ac95674c805695677d615a12ae3')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
