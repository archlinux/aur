# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=openshift-developer-bin
pkgver=3.15.0
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
    'b9f4acd408839f55b39a5d72eb0fe2eabd293b6663834bec76a379709dfd0cbc'
)

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 "${srcdir}/odo-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/odo"
}
