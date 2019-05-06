# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=caja-mediainfo-tab
pkgver=1.0
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/caja-mediainfo-tab"
license=('GPL3')
depends=('python2-mediainfodll' 'python2-caja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c3180ff9d75015bfcf94b540c9e82f2c1a9f10c18ab5b2be9ff6f96b94298efd')

prepare() {
    sed -i 's,/usr/bin/python,/usr/bin/python2,' "$pkgname-$pkgver/caja-extension/$pkgname.py"
}

package() {
    install -Dm644 "$pkgname-$pkgver/caja-extension/$pkgname.py" "$pkgdir/usr/share/caja-python/extensions/$pkgname.py"
    install -d "$pkgdir/usr/share/caja-python/extensions/$pkgname"
    cp -a "$pkgname-$pkgver/caja-extension/$pkgname/locale/." "$pkgdir/usr/share/caja-python/extensions/$pkgname/locale"
}
