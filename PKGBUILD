# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=openshift-pipelines-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Pipeline tools for OpenShift (tkn, tkn-pac, opc), binary release"
provides=('tkn' 'tkn-pac' 'opc')
conflicts=('opc' 'opc-bin')
arch=('x86_64')
url="https://docs.openshift.com/container-platform/latest/cli_reference/tkn_cli/installing-tkn.html"
license=("Apache")

source=(
    "https://mirror.openshift.com/pub/openshift-v4/clients/pipelines/${pkgver}/tkn-linux-amd64.tar.gz"
)

sha256sums=(
    '35a86c4aa6bc932cb51f9e4c15d384153cc73673fc0ac24b87106b303b36758a'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/tkn" "${pkgdir}/usr/bin/tkn"
    install -o root -g root -m 755 "${srcdir}/tkn-pac" "${pkgdir}/usr/bin/tkn-pac"
    install -o root -g root -m 755 "${srcdir}/opc" "${pkgdir}/usr/bin/opc"
}
