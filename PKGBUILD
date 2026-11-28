# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openflare-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="Distributed reverse proxy and edge security gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/Rain-kl/OpenFlare"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Rain-kl/OpenFlare/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/openflare_cli_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/openflare_cli_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('24cc6d322ce012d98d2c791ab3dc988a866e2ad48f4adaaea9ecb20060cb8bca')
sha256sums_x86_64=('aaee60f55d2f290d86ad569a89b4e98c430e0c407284f74d6509e00ec70a478d')
sha256sums_aarch64=('9353b5c3180ccf77be33a0d6462a479b450bf8d3485092e9effe3cb7fb5a5af1')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="openflare_cli_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="openflare_cli_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/openflare" "${pkgdir}/usr/bin/openflare"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
