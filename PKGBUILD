# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=1.6.1.2812
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
license=("MIT")
optdepends=('google-chrome' 'microsoft-edge-stable-bin')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_reponame}-${pkgver}.zip"
        "https://raw.githubusercontent.com/pt-plugins/PT-Plugin-Plus/master/LICENSE")
sha256sums=('4b817e5641a71ae96d2e9dda856acb792d01cb84fec7f92d2b78207fb44f8b3b'
            '45fa060688adb1be3086220407400f68383277374e60ac86cd1e931e466d1a80')
options=(!strip)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    find . -type f \( -not -iname "*.zip" -a -not -iname LICENSE \) -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
