# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

_pkgname="paisa"
pkgname="${_pkgname}-bin"
pkgver=0.6.6
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
sha256sums=('2b2225ae94b879604b88820aa011866f0bb0acbdf5f88e55365afd36c6cc6afc'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
    install -Dm755 ${_pkgname}-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}"
}
