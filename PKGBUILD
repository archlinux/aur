# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=nemo-mediainfo-tab
pkgver=0.3
_pkgver=${pkgver}-python3
pkgrel=8
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/$pkgname"
license=('GPL3')
depends=('python-mediainfodll' 'nemo-python')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('6723405faaed04aec1c930fc74fcf099')

package() {
    cd "${pkgname}-${_pkgver}"
    install -Dm644 "nemo-extension/${pkgname}.py" "${pkgdir}/usr/share/nemo-python/extensions/${pkgname}.py"
    mkdir "${pkgdir}/usr/share/nemo-python/extensions/${pkgname}"
    cp -a "nemo-extension/${pkgname}/locale" "${pkgdir}/usr/share/nemo-python/extensions/${pkgname}/locale"
}
