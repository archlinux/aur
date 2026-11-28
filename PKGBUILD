# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ecschedule-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Manage Amazon ECS scheduled tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/Songmu/ecschedule"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ecschedule_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ecschedule_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ced802aa69a1be2a2510d59db679bbfbca7647f97d19e23247ba508b86746e8d')
sha256sums_aarch64=('a1aafeb8ae4dcf9adc89443d230c0eca22556ed8549ee6c7554df9bdd105f554')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ecschedule_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="ecschedule_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/ecschedule" "${pkgdir}/usr/bin/ecschedule"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
