# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: whf920521 <whf920521 at gmail dot com>

pkgname=zashboard-bin
_pkgname=zashboard
pkgver=2.4.1
pkgrel=1
pkgdesc='A dashboard using clash api'
arch=('any')
url="https://github.com/Zephyruso/zashboard"
license=('MIT')
optdepends=('clash: A rule-based tunnel in Go'
            'sing-box: The universal proxy platform'
            'clash-meta: Another Clash Kernel'
            'mihomo: Another Clash Kernel')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/dist.zip"
        "https://raw.githubusercontent.com/Zephyruso/zashboard/refs/tags/v${pkgver}/LICENSE")
sha256sums=('b0282d54530c4d4f672d615658922a1797d2234944f4f691f8fc2d1c701d0043'
            'ffc390eec51f16b58506b1a42c99fe0cd9ffea1e3081aab443100fd8c20182d9')

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd "${srcdir}/dist/"
    find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
