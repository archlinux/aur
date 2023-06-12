# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=shadowtube
pkgver=1.0.4
pkgrel=1
pkgdesc="A YouTube shadowban detection program."
arch=('any')
url="https://github.com/danehobrecht/shadowtube"
license=('GPL')
depends=("python>=3.7.3" and "python-pip" and "tor-browser")

source=("https://github.com/danehobrecht/shadowtube/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dcd4c87b504731db0fcb6332168b49a65b20d006c8b078f2fc6e6fd289fda75f')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 shadowtube "$pkgdir/usr/bin/shadowtube"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 settings.json "$pkgdir/etc/shadowtube/settings.json"
}