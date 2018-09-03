# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=caja-mediainfo-tab
pkgver=0.1
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/caja-mediainfo-tab"
license=('GPL3')
depends=('python2-mediainfodll' 'python2-caja')
provides=('caja-mediainfo-tab')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('82926eed7dbbfb6f0eb137c8a2cab9e3')

prepare() {
    sed -i 's,/usr/bin/python,/usr/bin/python2,' ${pkgname}-${pkgver}/caja-extension/${pkgname}.py
}

package() {
    install -Dm644 ${pkgname}-${pkgver}/caja-extension/${pkgname}.py ${pkgdir}/usr/share/caja-python/extensions/${pkgname}.py
}
