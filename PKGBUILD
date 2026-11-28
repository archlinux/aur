# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=arch-go-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Architecture checks for Go projects"
arch=('x86_64' 'aarch64')
url="https://github.com/arch-go/arch-go"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/arch-go_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/arch-go_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('edcb2f5e12976a4aab01d5bc3de8bc7314cde824dd04f4860ce44f4380b90d96')
sha256sums_aarch64=('aa3bfee33ad5ceb50d2bccb3057825c7079799d8711cf0c9ef785ad143c77ace')

package() {
  install -Dm755 "arch-go" "${pkgdir}/usr/bin/arch-go"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
