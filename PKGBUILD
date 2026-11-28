# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=backupx-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Self-hosted backup management platform for servers"
arch=('x86_64' 'aarch64')
url="https://github.com/Awuqing/BackupX"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Awuqing/BackupX/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/backupx-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/backupx-linux-arm64.tar.gz")
sha256sums=('20db17609bd84fa6fd3007c981b20cd6cebc92efcd3a921525c73aaef9062c96')
sha256sums_x86_64=('31a28537df6d0a6b71e20d95601e202d2c3b033972ec31dbcf68ce07c2f1617d')
sha256sums_aarch64=('a7ef51b15b77932385686c76b4aea918997bdb69e83845ac5c3d4f3a4900286c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="backupx-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="backupx-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/backupx" "${pkgdir}/usr/bin/backupx"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
