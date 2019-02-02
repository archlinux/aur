# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.0.0_rc.6+oryOS.10
pkgrel=1
pkgdesc="ORY Hydra is a hardened, certified OAuth2 and OpenID Connect server optimized for low-latency, high throughput, and low resource consumption."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra-linux-amd64")
sha256sums=('cfed91ef4fc6485356fc1429e9ca6588e40bdc8ff30476c707cf4e65f45da4b1')

package() {
    mv "${srcdir}/hydra-linux-amd64" "${srcdir}/hydra"
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
