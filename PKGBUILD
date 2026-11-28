# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-swagger3-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Generate OpenAPI 3 specs from Go annotations"
arch=('x86_64' 'aarch64')
url="https://github.com/parvez3019/go-swagger3"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-swagger3_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-swagger3_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f40fc058c52dcb2049a430fdd8b7a6fcef9728c4c78d4918219fa1521ec965b7')
sha256sums_aarch64=('0170c572cf2a70ae988b0f6e1cad2d9550b021745eab13da5e55a0fd9b28e1a3')

package() {
  install -Dm755 "go-swagger3" "${pkgdir}/usr/bin/go-swagger3"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
