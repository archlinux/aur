# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=httpmon-bin
pkgver=0.1.16
pkgrel=1
pkgdesc="Terminal HTTP/HTTPS debugging proxy with MITM intercept and a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/kostyay/httpmon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/httpmon_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/httpmon_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('941b6f05c19688efe1fe70b44d50b7ab6cff8999a811b1140e1c395ec223e832')
sha256sums_aarch64=('41c32064fe3670bf2762d1c4c076bce10fb82a18fdb62c03a97838d2d0b3f229')

package() {
  install -Dm755 "httpmon" "${pkgdir}/usr/bin/httpmon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
