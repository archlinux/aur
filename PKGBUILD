# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=1.6.1.2870
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
license=("MIT")
optdepends=('google-chrome' 'microsoft-edge-stable-bin')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_reponame}-${pkgver}.zip"
        "https://raw.githubusercontent.com/pt-plugins/PT-Plugin-Plus/master/LICENSE")
sha256sums=('57cd42e4d33869cbfcfb09476318bf35bbe27009c96faaa884c38f51cf189d23'
            'b4b8cd767ca469a9e62345c044a03a86a569cce9feee86181621bb3b23339604')
options=(!strip)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    find . -type f \( -not -iname "*.zip" -a -not -iname LICENSE \) -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
