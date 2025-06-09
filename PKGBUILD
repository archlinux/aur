pkgname=gamepadla-polling
pkgver=1.2.0.1
pkgrel=1
pkgdesc="Unofficial Python wrapper for Nyaa anime torrent sites"
url="https://github.com/cakama3a/Polling"
depends=('python>=3.10' 'python-requests' 'python-numpy' 'python-colorama' 'python-pygame')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"gamepadla-polling.desktop")
sha256sums=('1e9dd6f2f5bf752e12d313230a9ffcd4ba515302d17dcaf324c3a479dd0c9b73'
	'SKIP')

build() {
	cd "Polling-${pkgver}"
	sed -i '1s|^|#!/usr/bin/env python3\n|' Polling.py
	chmod +x Polling.py
}

package() {
	install -Dm644 gamepadla-polling.desktop -t "$pkgdir"/usr/share/applications/
	cd "Polling-${pkgver}"
	install -Dm755 Polling.py "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
	install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
	install -Dm644 icon.ico "$pkgdir"/usr/share/icons/$pkgname.ico
}
