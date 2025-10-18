# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=capacity-tester
_pkgname=CapacityTester
pkgver=0.6
pkgrel=1
pkgdesc="A simple tool that attempts to determine if a drive is a fake or not."
arch=("x86_64" "i686" "aarch64")
url="https://github.com/c0xc/CapacityTester"
license=("GPL3")
depends=("hicolor-icon-theme" "qt5-base")
makedepends=("gcc" "make" "qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('af38aede9cddc47d7bc1748f3fa9fcbffb6b6663d7ce1b05de8c03c7c772869e5550a899316a462c9b317b2bba8933f5789e1493e53ce378212e23058a1f4ecb')

build() {
    cd ${_pkgname}-${pkgver}

    qmake
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    install -Dm 755 -t "${pkgdir}/usr/bin" "bin/${pkgname}"
    install -Dm 644 -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps" "res/${pkgname}.png"
    install -Dm 644 -t "${pkgdir}/usr/share/applications" "res/${pkgname}.desktop"
}
