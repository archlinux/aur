# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=govctl-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="Governance harness for AI coding"
arch=('x86_64' 'aarch64')
url="https://github.com/govctl-org/govctl"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/govctl-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/govctl-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('106689d246ee1acf24127d424de0f83d91509ee888d1d2f80c24fe8e7ab9338b')
sha256sums_aarch64=('ddd15d80e033d7f82fce28d63268da3037096c2e04eaca0fe1fcab14ee230c19')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="govctl-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="govctl-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/govctl" "${pkgdir}/usr/bin/govctl"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
