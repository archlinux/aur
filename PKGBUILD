# Maintainer: devome <evinedeng@hotmail.com>

pkgname="metacubexd"
pkgver=1.136.1
pkgrel=1
pkgdesc="Mihomo Dashboard, The Official One, XD"
arch=("any")
url="https://github.com/MetaCubeX/${pkgname}"
license=("MIT")
provides=("${pkgname}"{,-bin})
conflicts=("${pkgname}"{,-bin})
makedepends=("npm")
optdepends=('clash: A rule-based tunnel in Go'
            'mihomo: Another Clash Kernel by MetaCubeX'
            'sing-box: The universal proxy platform')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3b015537906c325dac92f89d761f4e771fe05610ac57f8886548c1cadef40734')

build() {
    cd "${pkgname}-${pkgver}"
    npm install
    npm run build
}

package() {
    cd "${pkgname}-${pkgver}/dist"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${pkgname}/"{} \;
}
