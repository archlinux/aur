# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bank-vaults-bin
pkgver=1.33.2
pkgrel=1
pkgdesc="A Vault swiss-army knife: A CLI tool to init, unseal and configure Vault (auth methods, secret engines)"
arch=('x86_64' 'aarch64')
url="https://github.com/bank-vaults/bank-vaults"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bank-vaults_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bank-vaults_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f3096393512b278a1c8dcd64aa77543a798fee94a0954b48649a5d12a9f5e25b')
sha256sums_aarch64=('88e9d0deef0185ab0efaabe90c2569533221663c7f03112e4ad5a8d1e16e515c')

package() {
  install -Dm755 "template" "${pkgdir}/usr/bin/template"
  install -Dm755 "bank-vaults" "${pkgdir}/usr/bin/bank-vaults"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
