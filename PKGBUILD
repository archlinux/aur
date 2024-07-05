# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=openshift-pipelines-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Pipeline tools for OpenShift (tkn, tkn-pac, opc), binary release"
provides=('tkn' 'tkn-pac' 'opc')
conflicts=('opc' 'opc-bin')
arch=('x86_64')
url="https://docs.openshift.com/container-platform/latest/cli_reference/tkn_cli/installing-tkn.html"
license=("Apache")

source=(
    "tkn-v${pkgver}-linux-amd64.tar.gz::https://mirror.openshift.com/pub/openshift-v4/clients/pipelines/${pkgver}/tkn-linux-amd64.tar.gz"
)

sha256sums=(
    '06320b6ebfbae7cabc8b3ce6346850e1c864627b8a8d36e3bcb72361edc382ea'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/tkn" "${pkgdir}/usr/bin/tkn"
    install -o root -g root -m 755 "${srcdir}/tkn-pac" "${pkgdir}/usr/bin/tkn-pac"
    install -o root -g root -m 755 "${srcdir}/opc" "${pkgdir}/usr/bin/opc"
}
