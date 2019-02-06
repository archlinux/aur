# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=nautilus-mediainfo
pkgver=0.2
_pkgver=${pkgver}-python3
pkgrel=5
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nautilus-mediainfo"
license=('GPL3')
depends=('python-mediainfodll' 'python-nautilus')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz")
md5sums=('a4286dcd0e11f8f5cbb4bab11605bd0c')

package() {
	cd "${pkgname}-${_pkgver}"
    install -Dm644 nautilus-extension/${pkgname}.py ${pkgdir}/usr/share/nautilus-python/extensions/${pkgname}.py
    mkdir ${pkgdir}/usr/share/nautilus-python/extensions/${pkgname}
    cp -a nautilus-extension/${pkgname}/locale/. ${pkgdir}/usr/share/nautilus-python/extensions/${pkgname}/locale
}
