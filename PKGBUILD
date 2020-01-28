# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=nemo-mediainfo-tab
pkgver=1.0
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nemo-mediainfo-tab"
license=('GPL3')
depends=('python-mediainfodll' 'nemo-python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-man/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d103f38340bed1b585d5a5e51f0f8c04ff48de58e36c89541e927146e70b17f7')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 "nemo-extension/$pkgname.py" \
		"$pkgdir/usr/share/nemo-python/extensions/$pkgname.py"
	install -d "$pkgdir/usr/share/nemo-python/extensions/$pkgname"
	cp -a "nemo-extension/$pkgname/locale" \
		"$pkgdir/usr/share/nemo-python/extensions/$pkgname/locale"
}
