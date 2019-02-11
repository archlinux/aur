# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='kongdash'
pkgname="${_pkgname}-bin"
pkgver=0.3.0
pkgrel=1
pkgdesc="ORY Hydra is a hardened, certified OAuth2 and OpenID Connect server optimized for low-latency, high throughput, and low resource consumption."
arch=('x86_64')
url="https://ajaysreedhar.github.io/kongdash"
license=('MIT')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ajaysreedhar/kongdash/releases/download/v${pkgver}/kongdash-${pkgver}-linux-x64.tar.gz")
sha256sums=('d74c68e08109783cb9160daccdc91ead58c60ebbb41a1a6253a55219b0c7e0f0')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -pr "${srcdir}/kongdash-${pkgver}-linux-x64/kongdash-x64" "${pkgdir}/opt/"

    install -m755 -D "${srcdir}/kongdash-${pkgver}-linux-x64/kongdash-x64/resources/kongdash.desktop" "${pkgdir}/usr/local/share/applications/kongdash.desktop"
}

