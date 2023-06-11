# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=shadowtube
pkgver=1.0.2
pkgrel=1
pkgdesc="A YouTube shadowban detection program."
arch=('any')
url="https://github.com/danehobrecht/shadowtube"
license=('GPL')
depends=('python37' 'python-requests' 'python-pysocks' 'python-cssselect' 'python-lxml' 'python-stem' 'argparse')

source=("https://github.com/danehobrecht/shadowtube/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('278c667a5279a7b72fde9f443de1adbc82d20cf211eaf6dfcd8ceec30cbff694')

package() {
	cd "$srcdir"
	install -Dm755 main.py "$pkgdir/usr/bin/shadowtube"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 settings.json "$pkgdir/etc/shadowtube/settings.json"
}