# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=capacity-tester
_pkgname=CapacityTester
pkgver=0.7c
pkgrel=1
pkgdesc="A simple tool that attempts to determine if a drive is a fake or not."
arch=("x86_64" "i686" "aarch64")
url="https://github.com/c0xc/CapacityTester"
license=("GPL3")
depends=("hicolor-icon-theme" "qt5-base")
makedepends=("gcc" "make" "qt5-tools")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('fa902c9ff3126b31df4ae5d72d5fcd1940bee64760f2e5132f2ac9e538320db394fbac51fc2a1b9d6cbc1889c3f2899bb520d9e051e2204adbc0ddc7e2c93e19')

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
