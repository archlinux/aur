# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-web-frontend"
pkgver=0.3.12
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
    "1e79660ead2f7a61649b31134db1d78c43eed040691032fa9c4155a97f68ab920e57eb952e20ec772c51103b5bcc4b747ed0489f9b971cb649def84840ec0b27"
    "4157986cf511d837141657ad499c6d34302a7b2c4fce138d66dd88c50f9b4ece7dbdc03351a41182e79ccedd46abe76cfd452e7e9834b39cad4c7b28d36364f2"
)

package() {
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/scrutiny-web-frontend/LICENSE"
    install -Dm644 "dist/3rdpartylicenses.txt" "${pkgdir}/usr/share/licenses/scrutiny-web-frontend/3rdpartylicenses.txt"

    install -dm755 "${pkgdir}/usr/share/scrutiny-web-frontend"
    cp -r dist "${pkgdir}/usr/share/scrutiny-web-frontend/dist"
    chmod -R u+rwX,go+rX "${pkgdir}/usr/share/scrutiny-web-frontend/dist"
}
