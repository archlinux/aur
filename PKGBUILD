# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ktor-cli-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Create Ktor projects from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/ktorio/ktor-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ktorio/ktor-cli/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ktor_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ktor_linux_arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('b519d9ca6f3d0f39ed3fcd9560cdf1074b34c7463b12ed9e7370ab7a8d127eb2')
sha256sums_aarch64=('e413a1a95fab84ab1313ca4d03dac49e6ebe0f8afc03a79e6fb11e74944b4ec3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ktor"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
