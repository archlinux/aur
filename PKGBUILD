# Maintainer: Sematre <sematre at gmx dot de>
pkgname=mklittlefs-bin
pkgver=3.0.0
commit="295fe9b"
pkgrel=1

pkgdesc="Utility for creating littlefs for upload on the ESP8266."
arch=('x86_64')
url="https://github.com/earlephilhower/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/x86_64-linux-gnu-mklittlefs-${commit}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/earlephilhower/${pkgname%-bin}/${pkgver}/LICENSE.txt")
sha256sums=('49618bc47deddad29bfb3991e4244228e9f8e9c61c3bd239c19f85ff4dee1ab8'
            '66de3091aa039c7e6189acbf3e2625b9f0b81d1f24659e412a20736badf313b6')

package() {
  install -Dm 755 "${pkgname%-bin}/${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
