# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=nautilus-mediainfo
pkgver=0.3
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/$pkgname"
license=('GPL3')
depends=('python-mediainfodll' 'python-nautilus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-man/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('13b47cb19e7e033b03af3195404a8d9d45646665d8fd8212decd6780c79483ea')

package() {
	cd "$pkgname-$pkgver"
    install -Dm644 nautilus-extension/$pkgname.py $pkgdir/usr/share/nautilus-python/extensions/$pkgname.py
    install -d $pkgdir/usr/share/nautilus-python/extensions/$pkgname
    cp -a nautilus-extension/$pkgname/locale/. $pkgdir/usr/share/nautilus-python/extensions/$pkgname/locale
}
