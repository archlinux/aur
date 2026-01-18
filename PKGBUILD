# Maintainer: Kristofers Solo <dev at kristofers dot xyz>

_pkgname=tuxedo-control-center
_svname=tccd
pkgname="${_pkgname}-runit"
pkgver=20260118
pkgrel=1
pkgdesc="runit service for TUXEDO Control Center"
arch=("x86_64")
url="https://github.com/tuxedocomputers/tuxedo-control-center"
license=("GPL-3.0-or-later")
depends=("runit" "tuxedo-control-center-bin")
source=("${_svname}.run" "${_svname}.finish")
sha256sums=("d5d89733cb42db73ad8f13bcf0d84a0a0ed3eab89e5577b89450c08690c85022"
    "aaaa021aeb8a99a126db5b696536b1b30c750ec21d85887c062f3ebbdbf443f5")

package() {
    install -Dm755 "$srcdir/${_svname}.run" "${pkgdir}/etc/runit/sv/tccd/run"
    install -Dm755 "$srcdir/${_svname}.finish" "${pkgdir}/etc/runit/sv/tccd/finish"
}
