# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='profile-cleaner'
pkgver=2.34
pkgrel=1
pkgdesc='Reduces profile size by cleaning their sqlite databases.'
arch=('any')
url='https://github.com/graysky2/profile-cleaner'
license=('MIT')
depends=('bc' 'parallel' 'sqlite')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('840001094760e69c891f2ccc82605b8caca4e637e794552149b25930c64de42d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
