# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='backdrop-randomizer'
pkgver=2.24
pkgrel=1
pkgdesc='Companion for xfdesktop which randomly cycles through wallpapers without repeating them until all have been displayed once.'
arch=('any')
url='https://github.com/graysky2/backdrop-randomizer'
license=('MIT')
depends=('xfdesktop')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('1de09e0e11ff64d584255197273374f639035f313334b92895bcac18c65fc210')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
