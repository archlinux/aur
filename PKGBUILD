# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentpipe-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Orchestrate conversations between different AI CLI tools"
arch=('x86_64' 'aarch64')
url="https://github.com/kevinelliott/agentpipe"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kevinelliott/agentpipe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agentpipe_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agentpipe_linux_arm64.tar.gz")
sha256sums=('03b2d155ffc34e0e1eea7b39300ea79d6229bca4d42ffd448c12f2c588491ad5')
sha256sums_x86_64=('de87ecac89d495c63550de8bb33399198258d1280d07c153c25c8e5f1fdcce79')
sha256sums_aarch64=('84e2b9a930367bab501efc87631f52874df9c55e91e6782e10a3f0f8d30675eb')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/agentpipe_linux_amd64" "${pkgdir}/usr/bin/agentpipe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
