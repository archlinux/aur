# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=1.6.1.2765
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
license=("MIT")
optdepends=('google-chrome' 'microsoft-edge-stable-bin')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_reponame}-${pkgver}.zip"
        "https://raw.githubusercontent.com/pt-plugins/PT-Plugin-Plus/master/LICENSE")
sha256sums=('8db8364ac6de071b3a2a9a0e6ef55e9c0f2f89e537d2922ff0113bcd41b64603'
            'b4b8cd767ca469a9e62345c044a03a86a569cce9feee86181621bb3b23339604')
options=(!strip)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    find . -type f \( -not -iname "*.zip" -a -not -iname LICENSE \) -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
