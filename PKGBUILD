# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=horenso-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Command wrapper that reports the result"
arch=('x86_64' 'aarch64')
url="https://github.com/Songmu/horenso"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/horenso_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/horenso_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c2d63d811659b9038409f7396ce4c31f5dac2b85531884149658feb21e508f21')
sha256sums_aarch64=('1bb069a5f62d969eff36fba801ecafcc3b59562da61592b7c548807f23d0db25')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="horenso_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="horenso_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/horenso" "${pkgdir}/usr/bin/horenso"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
