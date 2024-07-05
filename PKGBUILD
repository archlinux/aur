# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=openshift-developer-bin
pkgver=3.16.1
pkgrel=1
pkgdesc="Developer tools for OpenShift (odo), binary release"
provides=("odo")
arch=('x86_64')
url="https://github.com/redhat-developer/odo"
license=("Apache")

source=(
    "odo-linux-amd64-v${pkgver}::https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/odo/v${pkgver}/odo-linux-amd64"
)

sha256sums=(
    'c271940c4b9d88f753423aae78984b7ef7a99ac9133154714b679f8b8b3bec8e'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/odo-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/odo"
}
