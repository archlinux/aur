# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=nautilus-mediainfo
pkgver=0.2
pkgrel=1
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nautilus-mediainfo"
license=('GPL3')
depends=('python2-mediainfodll' 'python2-nautilus')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('48c9f30c64ff997b7f968ea7ec439a83')

prepare() {
    sed -i 's,/usr/bin/python,/usr/bin/python2,' ${pkgname}-${pkgver}/nautilus-extension/${pkgname}.py
}

package() {
    install -Dm644 ${pkgname}-${pkgver}/nautilus-extension/${pkgname}.py ${pkgdir}/usr/share/nautilus-python/extensions/${pkgname}.py
    mkdir ${pkgdir}/usr/share/${pkgname}
    cp -a ${pkgname}-${pkgver}/nautilus-extension/${pkgname}/locale/. ${pkgdir}/usr/share/${pkgname}/locale
}
