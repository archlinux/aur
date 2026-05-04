# Maintainer: ZeroiJ <sujalbirwadkar19@gmail.com>
pkgname=omadoctor-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Interactive TUI wizard that diagnoses and fixes common Omarchy Linux issues"
arch=('x86_64')
url="https://github.com/ZeroiJ/omarchy-doctor"
license=('MIT')
depends=()
optdepends=()
provides=('omadoctor')
conflicts=('omadoctor')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ZeroiJ/omarchy-doctor/releases/download/v${pkgver}/omadoctor-v${pkgver}-x86_64.tar.gz")
sha256sums=('b9b944f3d41ac633d5f1dfefca4f2fb5cb85db663842432f0a33c221c554eaaf')

package() {
    cd "${srcdir}/omadoctor-v${pkgver}-x86_64"

    # Install binary
    install -Dm755 "omadoctor" "${pkgdir}/usr/bin/omadoctor"

    # Install VERSION file
    install -Dm644 "VERSION" "${pkgdir}/usr/share/omadoctor/VERSION"

    # Install fix definitions
    mkdir -p "${pkgdir}/usr/share/omadoctor/fixes"
    install -Dm644 fixes/*.toml "${pkgdir}/usr/share/omadoctor/fixes/"

    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
