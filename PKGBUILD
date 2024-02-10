# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="paisa"
pkgname="${_pkgname}-bin"
pkgver=0.6.5
pkgrel=1
pkgdesc="Personal Finance Manager."
arch=("x86_64")
url="https://github.com/ananthakumaran/paisa"
license=("AGPL3")
depends=("ledger" "sqlite")
provides=("paisa")
conflicts=("paisa")
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-cli-linux-amd64"
        "https://raw.githubusercontent.com/ananthakumaran/paisa/master/COPYING")
sha256sums=('f8f97b6c3cbaff3a4b0ae24e11d5f8c03a99ad82557907f47ba45c8701f87419'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
    install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}"
}
