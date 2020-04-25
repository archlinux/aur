# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=nemo-mediainfo-tab
pkgver=1.0.3
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nemo-mediainfo-tab"
license=('GPL3')
depends=('python-mediainfodll' 'nemo-python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-man/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f5b6c1ba85296c1e2eada26578bc130d951c32e3839c516d2e379caba7a48abc')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's/MediaInfoDLL3/MediaInfoDLL/g' "nemo-extension/$pkgname.py"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 "nemo-extension/$pkgname.py" \
		"$pkgdir/usr/share/nemo-python/extensions/$pkgname.py"
	install -d "$pkgdir/usr/share/nemo-python/extensions/$pkgname"
	cp -a "nemo-extension/$pkgname/locale" \
		"$pkgdir/usr/share/nemo-python/extensions/$pkgname/locale"
}
