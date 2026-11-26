# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=binenv-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Install and manage versions of many CLI tools from one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/devops-works/binenv"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/devops-works/binenv/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/binenv_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/binenv_linux_arm64")
sha256sums=('0859ca048f4450a1928b71dc77b5bf5a8a24e4876ca288a0484ea5b322ba7d30')
sha256sums_x86_64=('f78a46c42a9724b78ff8def1de4a80ea75c46a5eba48b641d3bd9653b964d4c2')
sha256sums_aarch64=('3a3bde80ccd29a956b79b90fff31aa9a078773de0d6cc261fbaa0ddfa92dfdbb')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/binenv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
