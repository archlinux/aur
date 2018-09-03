# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=nautilus-mediainfo
pkgver=0.1
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nautilus-mediainfo"
license=('GPL3')
depends=('python2-mediainfodll' 'python2-nautilus')
provides=('nautilus-mediainfo-tab')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('779e0ccede05bd13e4f70a267c10d038')

prepare() {
    sed -i 's,/usr/bin/python,/usr/bin/python2,' ${pkgname}-${pkgver}/nautilus-extension/${pkgname}.py
}

package() {
    install -Dm644 ${pkgname}-${pkgver}/nautilus-extension/${pkgname}.py ${pkgdir}/usr/share/nautilus-python/extensions/${pkgname}.py
}
