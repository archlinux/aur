# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="paisa"
pkgname="${_pkgname}-bin"
pkgver=0.5.2
pkgrel=1
pkgdesc="Personal Finance Manager."
arch=("x86_64")
url="https://github.com/ananthakumaran/paisa"
license=("AGPL3")
depends=("ledger" "sqlite3")
provides=("paisa")
conflicts=("paisa")
source=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-cli-linux-amd64"
        "https://raw.githubusercontent.com/ananthakumaran/paisa/master/COPYING")
sha256sums=('657ded25f29ee01539b5030e56d9de751357bb4509c259177cd5e9403e88c5c4'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}"
}
