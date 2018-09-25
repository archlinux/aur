# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.0.0_beta.9
pkgrel=2
pkgdesc="ORY Hydra is a hardened, certified OAuth2 and OpenID Connect server optimized for low-latency, high throughput, and low resource consumption."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra-linux-amd64")
sha256sums=('140cc51bd2ef1d41469e5c75d7062daae5558f362d2ffc41e7e43375e2a18085')

package() {
    mv "${srcdir}/hydra-linux-amd64" "${srcdir}/hydra"
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
