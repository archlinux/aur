# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=openshift-pipelines-bin
pkgver=1.14.3
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
    'c72e4d187c760377b21d397fda7520a60030a98596b5ce7f06e843adba38e91d'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/tkn" "${pkgdir}/usr/bin/tkn"
    install -o root -g root -m 755 "${srcdir}/tkn-pac" "${pkgdir}/usr/bin/tkn-pac"
    install -o root -g root -m 755 "${srcdir}/opc" "${pkgdir}/usr/bin/opc"
}
