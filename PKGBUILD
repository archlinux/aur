# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=caja-mediainfo-tab
pkgver=0.2
pkgrel=5
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/caja-mediainfo-tab"
license=('GPL3')
depends=('python2-mediainfodll' 'python2-caja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2f583ac80988040bfb6c843fbc0af5fd9237a145c36d0db5b076eaa6af2dc5c8')

prepare() {
    sed -i 's,/usr/bin/python,/usr/bin/python2,' "$pkgname-$pkgver/caja-extension/$pkgname.py"
}

package() {
    install -Dm644 "$pkgname-$pkgver/caja-extension/$pkgname.py" "$pkgdir/usr/share/caja-python/extensions/$pkgname.py"
    install -d "$pkgdir/usr/share/caja-python/extensions/$pkgname"
    cp -a "$pkgname-$pkgver/caja-extension/$pkgname/locale/." "$pkgdir/usr/share/caja-python/extensions/$pkgname/locale"
}
