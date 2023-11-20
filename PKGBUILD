# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=tinyfilemanager
pkgver=2.5.3
pkgrel=3
pkgdesc="Web based, simple, fast and small file manager"
arch=('any')
url="https://github.com/prasathmani/${pkgname}"
license=('GPL3')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('56a4c46ed11cf01d72675584961e3ad6')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install files
    install -d "${pkgdir}/usr/share/${pkgname}/assets"{/css,/fonts,/js}
    install -Dm644 "${pkgname}.php" translation.json -t "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 assets/css/* -t "${pkgdir}/usr/share/${pkgname}/assets/css"
    install -Dm644 assets/fonts/* -t "${pkgdir}/usr/share/${pkgname}/assets/fonts"
    install -Dm644 assets/js/* -t "${pkgdir}/usr/share/${pkgname}/assets/js"
}
