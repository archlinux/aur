# Maintainer: anon

_id=kcdkjieebimpglmfgdffbpobpmihfgnb
pkgname=coincidence-detector
pkgver=14.88.28
pkgrel=1
pkgdesc="coincidence detector"
arch=('any')
url="https://coincidencedetector.com"
license=('')
source=("${pkgname}-${pkgver}.crx::https://coincidencedetector.com/coincidence-detector-$pkgver.crx")
noextract=("${pkgname}-${pkgver}.crx")
sha256sums=('03147eed83fec6246206d78d7f26508bd65f28db8907517fd57281bb02962639')

prepare() {
    # Create extension json
    cat << EOF > "${_id}".json
{
    "external_crx": "/usr/lib/${pkgname}/${pkgname}-${pkgver}.crx",
    "external_version": "${pkgver}"
}
EOF
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/chromium/extensions/" "${_id}.json"
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"
}
