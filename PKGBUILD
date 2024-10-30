# shellcheck disable=SC2034,SC2154
# Maintainer: Nogweii <packages@nogweii.net>
# Original maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-web-frontend"
pkgver=0.8.1
pkgrel=1
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds - Web Frontend Files"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT" "Unlicense" "custom:CC0" "BSD" "Apache")
arch=("any")
source=(
    "https://github.com/AnalogJ/scrutiny/releases/download/v${pkgver}/scrutiny-web-frontend.tar.gz"
)
sha512sums=('75749894d779d4a03af01ead7b49aee1251ee4b74e2ae1797a089e446fbcbcb1faf8cb22776e000217610f6af3d12c384e82e516e4613890a9b91115e58f2661')

package() {
    cd "${srcdir}/dist" || exit

    install -Dm644 "3rdpartylicenses.txt" "${pkgdir}/usr/share/licenses/scrutiny-web-frontend/3rdpartylicenses.txt"

    install -dm755 "${pkgdir}/usr/share/scrutiny-web-frontend"
    cp -r ./* -t "${pkgdir}/usr/share/scrutiny-web-frontend/"
    chmod -R u+rwX,go+rX "${pkgdir}/usr/share/scrutiny-web-frontend/"
}
