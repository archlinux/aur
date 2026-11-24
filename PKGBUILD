# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubenodeusage-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="Kubernetes node and pod resource usage in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/aksarav/kubenodeusage"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/aksarav/kubenodeusage/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/KubeNodeUsage-linux-amd64-v${pkgver}.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/KubeNodeUsage-linux-arm64-v${pkgver}.zip")
sha256sums=('777c7a3de313755342baddb53d0f4cf07adaaa00f6a8f497fc145a86b19c0d8c')
sha256sums_x86_64=('9e3b94c342c4365e7aa4aa9825c4cbfccf7b8770d9addc55493346219bb5e9d1')
sha256sums_aarch64=('4b9806c904e0a9142193bba9e55da6afe2980cbe3ae1ee9968669a109c0f4141')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/KubeNodeUsage-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/kubenodeusage"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
