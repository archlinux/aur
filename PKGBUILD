# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=talisman-bin
pkgver=1.37.0
pkgrel=1
pkgdesc="Pre-commit hook that blocks commits containing secrets"
arch=('x86_64' 'aarch64')
url="https://github.com/thoughtworks/talisman"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/thoughtworks/talisman/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/talisman_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/talisman_linux_arm64")
sha256sums=('05a62ecce937ab4cd4b761c4fb20a3311b01f7368d32211356ec572746bc38e3')
sha256sums_x86_64=('8e0ae8bb7b160bf10c4fa1448beb04a32a35e63505b3dddff74a092bccaaa7e4')
sha256sums_aarch64=('ca706f428a45d7a4ed3cc5c3cf7b3e5b0dfce6f2f584000a117d0d602a0342b7')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/talisman"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
