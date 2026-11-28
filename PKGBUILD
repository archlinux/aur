# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gcccode-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="AI coding agent compatible with multiple LLMs"
arch=('x86_64' 'aarch64')
url="https://github.com/nearmetips/GCCcode"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gcccode_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gcccode_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b3baefc4534ea186af2f513c8ef13733b251af96da79da87838eef3b082ff407')
sha256sums_aarch64=('859b3a82ebfec28c939af980958405d06f8cb3826d11aa1104e9bbd120fe8e2e')

package() {
  install -Dm755 "gcccode" "${pkgdir}/usr/bin/gcccode"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
