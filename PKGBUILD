# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=nautilus-mediainfo
pkgver=1.0
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/$pkgname"
license=('GPL3')
depends=('python-mediainfodll' 'python-nautilus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-man/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('de96666b122eb7418aa316ef0c3ebc5442090698251fff1718849237c9c58a06')

package() {
	cd "$pkgname-$pkgver"
    install -Dm644 nautilus-extension/$pkgname.py $pkgdir/usr/share/nautilus-python/extensions/$pkgname.py
    install -d $pkgdir/usr/share/nautilus-python/extensions/$pkgname
    cp -a nautilus-extension/$pkgname/locale/. $pkgdir/usr/share/nautilus-python/extensions/$pkgname/locale
}
