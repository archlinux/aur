# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=geogebra
pkgname="${_pkgname}-html"
pkgver=5.4.936.0
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet (HTML files only)"
arch=("any")
url="https://www.geogebra.org"
license=("LicenseRef-GeoGebra:${url}/license")
optdepends=("caddy: for serving ${_pkgname} HTML files"
            "nginx: for serving ${_pkgname} HTML files"
            "traefik: for serving ${_pkgname} HTML files")
source=("${_pkgname}-${pkgver}.zip::https://download.geogebra.org/installers/${pkgver%.*.*}/geogebra-math-apps-bundle-${pkgver//./-}.zip")
sha256sums=('969abdbd5cc7fce201c4226f3ab4173a6ab119b3170e52528fffcd949dfa687e')

package() {
    cd GeoGebra/HTML5/5.0
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \;
    ln -sf GeoGebra.html "${pkgdir}/usr/share/webapps/${pkgname}/index.html"
}
