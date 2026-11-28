# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dmut-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Permutation, mutation and alteration of subdomains"
arch=('x86_64' 'aarch64')
url="https://github.com/bp0lr/dmut"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dmut_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dmut_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3308d8dee5d89192d4b077f607e64e64fb3614c75232b56f50433ad08bcca8bf')
sha256sums_aarch64=('d61c450a271d088a73275f6f171eff8d2108c660b8cbce609a55b967876fba32')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="dmut_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="dmut_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/dmut" "${pkgdir}/usr/bin/dmut"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
