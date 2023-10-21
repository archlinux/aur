# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=openshift-codeready-bin
pkgver=2.28.0
pkgrel=1
pkgdesc="CodeReady tools for OpenShift (crc), binary release"
provides=('crc')
conflicts=('crc-bin')
arch=('x86_64')
url="https://www.okd.io/crc"
license=("Apache")

source=(
    "crc-v${pkgver}-linux-amd64.tar.xz::https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/${pkgver}/crc-linux-amd64.tar.xz"
)

sha256sums=(
    '41a16e48b5e0790a3695fb567b3a78c4365d4e80910545b696bba91801242342'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/crc-linux-${pkgver}-amd64/crc" "${pkgdir}/usr/bin/crc"
}
