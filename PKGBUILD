# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-httpbin-bin
pkgver=2.26.0
pkgrel=1
pkgdesc="Go port of httpbin, the HTTP request and response testing service"
arch=('x86_64' 'aarch64')
url="https://github.com/mccutchen/go-httpbin"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-httpbin-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-httpbin-linux-arm64.tar.gz")
sha256sums_x86_64=('b5160d5ac6c873a859bcfe608d724acf000152dec2783ac0dfbdf655609327d4')
sha256sums_aarch64=('27260ee3c2d39b50d7217abc6db420e167baeccd80d4c20146e53046e1b543c8')

package() {
  install -Dm755 "go-httpbin" "${pkgdir}/usr/bin/go-httpbin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
