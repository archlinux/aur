# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tfedit-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Refactoring tool for Terraform"
arch=('x86_64' 'aarch64')
url="https://github.com/minamijoyo/tfedit"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tfedit_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tfedit_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7434e55f2cc51dab1f1d4d82797c8c2fe2ee35d9a8d0dba831ec0c604d8baf68')
sha256sums_aarch64=('16ff1e2f49796d8659641536f909edbfb78146fa864744a4111cec7980b941d5')

package() {
  install -Dm755 "tfedit" "${pkgdir}/usr/bin/tfedit"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
