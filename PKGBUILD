# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=keplearn-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Fast symbolic regression"
arch=('x86_64')
url="https://github.com/owls-on-wires/keplearn"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/keplearn-linux-x86_64.tar.gz")
sha256sums_x86_64=('24f7aa9e7af3b0f937a9229c2c5fb8b6b9a223928addde2185db9a028c5dbaa8')

package() {
  install -Dm755 "keplearn-linux-x86_64/keplearn" "${pkgdir}/usr/bin/keplearn"
  install -Dm644 "keplearn-linux-x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "keplearn-linux-x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
