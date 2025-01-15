# Maintainer: devome <evinedeng@hotmail.com>

_reponame="PT-Plugin-Plus"
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-bin"
pkgver=1.6.1.2798
pkgrel=1
pkgdesc="Microsoft Edge, Google Chrome, Firefox browser plugin (Web Extensions), which is mainly used to assist the seeds of downloading PT station."
arch=("any")
url="https://github.com/pt-plugins/${_reponame}"
provides=("${_pkgname}")
license=("MIT")
optdepends=('google-chrome' 'microsoft-edge-stable-bin')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_reponame}-${pkgver}.zip"
        "https://raw.githubusercontent.com/pt-plugins/PT-Plugin-Plus/master/LICENSE")
sha256sums=('506c0e7d983d565646b6f460eb610c4d2a0cbeba09b076f8e2c26393124674dd'
            'cd66a6138587ba65a3be1629ed36820c9c20ad1f630f5b311fcff219610b5f7e')
options=(!strip)

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    find . -type f \( -not -iname "*.zip" -a -not -iname LICENSE \) -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
