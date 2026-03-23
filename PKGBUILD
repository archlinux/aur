# Maintainer: pharmaracist <pharmaracist@github>
pkgname=noon-mirsald
pkgver=1.0.0
pkgrel=1
pkgdesc="مرسال — Noon native messaging host daemon for browser download interception"
arch=('any')
url="https://github.com/pharmaracist/mirsal"
license=('MIT')
depends=('python')
source=(
    "mirsald::https://raw.githubusercontent.com/pharmaracist/mirsal/main/daemon/mirsald"
    "protocol.py::https://raw.githubusercontent.com/pharmaracist/mirsal/main/daemon/protocol.py"
    "noon_mirsal.json::https://raw.githubusercontent.com/pharmaracist/mirsal/main/daemon/noon_mirsal.json"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -dm755 "${pkgdir}/usr/lib/noon-mirsal"
    install -dm755 "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"
    install -dm755 "${pkgdir}/usr/lib/firefox/native-messaging-hosts"

    install -Dm755 "${srcdir}/mirsald"      "${pkgdir}/usr/lib/noon-mirsal/mirsald"
    install -Dm644 "${srcdir}/protocol.py"  "${pkgdir}/usr/lib/noon-mirsal/protocol.py"

    install -Dm644 "${srcdir}/noon_mirsal.json" \
        "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/noon_mirsal.json"
    install -Dm644 "${srcdir}/noon_mirsal.json" \
        "${pkgdir}/usr/lib/firefox/native-messaging-hosts/noon_mirsal.json"
}
