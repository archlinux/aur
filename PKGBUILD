# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=1.6.1.2552
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
license=("MIT")
optdepends=('firefox' 'google-chrome' 'microsoft-edge-stable-bin')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_reponame}-${pkgver}.zip")
sha256sums=('006b6b88550051dba25f0b2a21f5e2da35df14c5147eb45c99691dcf07e7faae')
options=(!strip)

package() {
    find . -type f \( -not -iname "*.zip" \) -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
