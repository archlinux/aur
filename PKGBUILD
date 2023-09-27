# Maintainer: Sematre <sematre at gmx dot de>
pkgname=mklittlefs-bin
pkgver=3.2.0
_commit="975bd0f"
pkgrel=1

pkgdesc="Utility for creating littlefs for upload on the ESP8266."
arch=('x86_64')
url="https://github.com/earlephilhower/${pkgname%-bin}"
license=('MIT')

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/x86_64-linux-gnu-mklittlefs-${_commit}.tar.gz"
        "LICENSE.txt::https://raw.githubusercontent.com/earlephilhower/${pkgname%-bin}/${pkgver}/LICENSE.txt")
sha256sums=('e4a0948bf5c06cb8fdc216bb81ae89e65bd3d49a6007ddcd4fe4b51fe05abb75'
            '66de3091aa039c7e6189acbf3e2625b9f0b81d1f24659e412a20736badf313b6')

package() {
	install -Dm 755 "${pkgname%-bin}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm 644 "LICENSE.txt"                     -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
