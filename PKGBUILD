# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.138.0
pkgrel=1
pkgdesc="Mihomo Dashboard, The Official One, XD"
arch=("any")
url="https://github.com/MetaCubeX/${pkgname}"
license=("MIT")
provides=("${pkgname}"{,-bin})
conflicts=("${pkgname}"{,-bin})
makedepends=("yarn")
optdepends=('clash: A rule-based tunnel in Go'
            'mihomo: Another Clash Kernel by MetaCubeX'
            'sing-box: The universal proxy platform')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b12f6165c0397ebc4deb6f92cf7b356f563e20a96c519abb9843de2909a6f6b5')

build() {
    cd "${pkgname}-${pkgver}"
    yarn install
    yarn run build
}

package() {
    cd "${pkgname}-${pkgver}/dist"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
