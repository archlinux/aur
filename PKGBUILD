# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bit-tui-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Logo designer for the terminal with ANSI fonts, gradients, shadows and multi-format export"
arch=('x86_64' 'aarch64')
url="https://github.com/paulilaaso/bit"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'bit')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bit_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bit_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('adba07649b2b803935ab6cda996f60ae05aa05743f87456ceaead0032ac2e108')
sha256sums_aarch64=('97d747953a8842858eb6d4f231a2386ad466da0a03c8eab7605680fa5f426bc2')

package() {
  install -Dm755 "bit" "${pkgdir}/usr/bin/bit"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
