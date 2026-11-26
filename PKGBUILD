# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rota-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Proxy rotation engine with IP management and health monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/alpkeskin/rota"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rota_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rota_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d9157f391c3649ae32789247671e537bfeaf0bcda7d6638abd20250dc33521b2')
sha256sums_aarch64=('cf88d251b9f0836faba0e4a2c8f3755a75f4dbe546ee92d1fbc630803ce6e1ee')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rota_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="rota_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/rota" "${pkgdir}/usr/bin/rota"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
