# Maintainer: aozaki <aozakitouko at foxmail dot com>
# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: whf920521 <whf920521 at gmail dot com>

pkgname=zashboard-bin
_pkgname=zashboard
pkgver=3.28.0
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
sha256sums=('8d966a3b75292764d16a0e5796b6c6de0468bc71a7e9302f430f27b681f77b43'
            'ffc390eec51f16b58506b1a42c99fe0cd9ffea1e3081aab443100fd8c20182d9')

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd "${srcdir}/dist/"
    find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/${_pkgname}/"{} \;
}
