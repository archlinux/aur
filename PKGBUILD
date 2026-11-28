# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clawscan-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Composable security scanning harness for AI agent skills"
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/clawscan"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/openclaw/clawscan/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clawscan_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clawscan_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('9efd316ecf1c4c60f6fd5d26433142fff2b6794d7d328e9bc6179b29bf9c82a4')
sha256sums_x86_64=('f5a9c07b6ee88366f3bec0fd89ceeb1ebcdffa1b45232d6588165fec27249393')
sha256sums_aarch64=('0955a8423e211c11affeb1601c3aa2e995b9e7c76533e30ef7b616ac41f07653')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="clawscan_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="clawscan_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/clawscan" "${pkgdir}/usr/bin/clawscan"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
