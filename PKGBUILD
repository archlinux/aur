# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=geogebra
pkgname="${_pkgname}-html"
pkgver=5.4.927.1
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet (HTML files only)"
arch=("any")
url="https://www.geogebra.org"
license=("LicenseRef-GeoGebra:${url}/license")
optdepends=("caddy: for serving ${_pkgname} HTML files"
            "nginx: for serving ${_pkgname} HTML files"
            "traefik: for serving ${_pkgname} HTML files")
source=("${_pkgname}-${pkgver}.zip::https://download.geogebra.org/installers/${pkgver%.*.*}/geogebra-math-apps-bundle-${pkgver//./-}.zip")
sha256sums=('a8b76bbbcda83db60ad76c38d988673928cf1f62fda1bc4b83666f77dba17a3c')

package() {
    cd GeoGebra/HTML5/5.0
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \;
    ln -sf GeoGebra.html "${pkgdir}/usr/share/webapps/${pkgname}/index.html"
}
