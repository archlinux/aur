# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-web-frontend"
pkgver=0.3.5
pkgrel=1
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds - Web Frontend Files"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT" "Unlicense" "custom:CC0" "BSD" "Apache")
arch=("any")
source=(
    "scrutiny-web-frontend-${pkgver}.tar.gz::https://github.com/AnalogJ/scrutiny/releases/download/${pkgver}/scrutiny-web-frontend.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AnalogJ/scrutiny/master/LICENSE"
)
sha512sums=(
    "adfcf79900f02a40e23978266b1afa52c3b0d28d56db4f0c2ab2d7c34069edbe6c61925e47c3a5c77bafb567a72c92fb3ece2e88b923c2b609f7c7a49aada3ab"
    "4157986cf511d837141657ad499c6d34302a7b2c4fce138d66dd88c50f9b4ece7dbdc03351a41182e79ccedd46abe76cfd452e7e9834b39cad4c7b28d36364f2"
)

package() {
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/scrutiny-web-frontend/LICENSE"
    install -Dm644 "dist/3rdpartylicenses.txt" "${pkgdir}/usr/share/licenses/scrutiny-web-frontend/3rdpartylicenses.txt"

    install -dm755 "${pkgdir}/usr/share/scrutiny-web-frontend"
    cp -r dist "${pkgdir}/usr/share/scrutiny-web-frontend/dist"
    chmod -R u+rwX,go+rX "${pkgdir}/usr/share/scrutiny-web-frontend/dist"
}
