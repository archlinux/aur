# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ccteam-bin
pkgver=0.13.2
pkgrel=1
pkgdesc="Run coding agents from different vendors as one team, steered from Telegram, Lark or a browser"
arch=('x86_64' 'aarch64')
url="https://github.com/firstintent/ccteam"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ccteam-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ccteam-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('b2e98e36b5211a33298afed08f4e22dcdcfe964a01780b2620de09b341340cdf')
sha256sums_aarch64=('56a0a51932ced5c9ff7835610f422fc56a8f0322a837235de66391cd19ec69e4')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ccteam-v${pkgver}-linux-x64" ;;
    aarch64) _dir="ccteam-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/ccteam" "${pkgdir}/usr/bin/ccteam"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
