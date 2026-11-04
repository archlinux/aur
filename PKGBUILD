# shellcheck disable=SC2034,SC2154
# Maintainer: Nogweii <packages@nogweii.net>
# Original maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-web-frontend"
# renovate: datasource=github-releases depName=AnalogJ/scrutiny
pkgver=0.10.0
pkgrel=1
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds - Web Frontend Files"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT" "Unlicense" "custom:CC0" "BSD" "Apache")
arch=("any")
source=(
  "https://github.com/AnalogJ/scrutiny/releases/download/v${pkgver}/scrutiny-web-frontend.tar.gz"
)
sha512sums=('c726eeda332bca27039eaca0933349ffe1f6f0a58033f9daf81435d626d4e589feb2f8c8a904b6327a7cd148f672a651959d0080ae7a2c12cfb6535fbadbae57')

package() {
  cd "${srcdir}/dist" || exit

  install -Dm644 "3rdpartylicenses.txt" "${pkgdir}/usr/share/licenses/scrutiny-web-frontend/3rdpartylicenses.txt"

  install -dm755 "${pkgdir}/usr/share/scrutiny-web-frontend"
  cp -r ./* -t "${pkgdir}/usr/share/scrutiny-web-frontend/"
  chmod -R u+rwX,go+rX "${pkgdir}/usr/share/scrutiny-web-frontend/"
}
