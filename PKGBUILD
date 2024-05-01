# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=1.6.1.2623
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
license=("MIT")
optdepends=('google-chrome' 'microsoft-edge-stable-bin')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_reponame}-${pkgver}.zip")
sha256sums=('ffed3fc0db04da46103d19bc73b4baf850f74118eda3ddfc597690fc2ee87712')
options=(!strip)

package() {
    find . -type f \( -not -iname "*.zip" \) -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
