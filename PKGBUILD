# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=openshift-developer-bin
pkgver=3.14.0
pkgrel=1
pkgdesc="Developer tools for OpenShift (odo), binary release"
provides=("odo")
arch=('x86_64')
url="https://github.com/redhat-developer/odo"
license=("Apache")

source=(
    "https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/odo/v${pkgver}/odo-linux-amd64"
)

sha256sums=(
    '54f4f79492ab66fc6d941d75cbd136fd1b632a316909d699387d080cdb785eb0'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/odo-linux-amd64" "${pkgdir}/usr/bin/odo"
}
