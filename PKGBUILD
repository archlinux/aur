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
makedepends=("gcc" "make")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e8bd704f1cf48a3e54ed3d90ae1344d91d2044224ed663943d200636d16257e9a79572557533fe4541153f7b92b8acb93e205f0fc22c29c04ccf299cf9d66337')

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
