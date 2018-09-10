# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=caja-mediainfo-tab
pkgver=0.2
pkgrel=2
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/caja-mediainfo-tab"
license=('GPL3')
depends=('python2-mediainfodll' 'python2-caja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('974d6325685c626b82b2e2768bedc37a')

prepare() {
    sed -i 's,/usr/bin/python,/usr/bin/python2,' ${pkgname}-${pkgver}/caja-extension/${pkgname}.py
}

package() {
    install -Dm644 ${pkgname}-${pkgver}/caja-extension/${pkgname}.py ${pkgdir}/usr/share/caja-python/extensions/${pkgname}.py
    mkdir ${pkgdir}/usr/share/${pkgname}
    cp -a ${pkgname}-${pkgver}/caja-extension/${pkgname}/locale/. ${pkgdir}/usr/share/${pkgname}/locale
}
