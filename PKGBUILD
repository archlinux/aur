# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=faynosync-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Self-hosted update server for desktop apps"
arch=('x86_64' 'aarch64')
url="https://github.com/ku9nov/faynoSync"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/faynoSync_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/faynoSync_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6e750f60794581a04412b47e1c494ff362e7e81314d6c925c27e0f8bd1068135')
sha256sums_aarch64=('443b3926cf284b42f28ac6dc2dd14cab6bfe8949a5d5432a342ac9573864f237')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="faynoSync_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="faynoSync_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/faynoSync" "${pkgdir}/usr/bin/faynoSync"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
