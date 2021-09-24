# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=structurizr-cli
pkgver=1.14.0
pkgrel=1
pkgdesc="A command line utility for Structurizr"
arch=(any)
url="https://github.com/structurizr/cli"
license=('apache')
depends=('java-runtime')
makedepends=()
source=("https://github.com/structurizr/cli/releases/download/v${pkgver}/structurizr-cli-${pkgver}.zip" "launcher.sh")
sha256sums=('3239d0da724de4daa157f64097e5fe01cd9ef04aa205b7a521b30eb7c56ffc6e'
            'd360ef7d8ac0106c3e735d3f74628ed24e6604ad7bc254d4b85a49a5b933bf27')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/opt/structurizr-cli"
    mkdir -p "${pkgdir}/usr/bin"
    cp "structurizr-cli-${pkgver}.jar" "${pkgdir}/opt/structurizr-cli"
    cp "structurizr.sh" "${pkgdir}/opt/structurizr-cli/structurizr.sh"
    chmod +x "${pkgdir}/opt/structurizr-cli/structurizr.sh"
    cp launcher.sh "${pkgdir}/usr/bin/structurizr"
    chmod +x "${pkgdir}/usr/bin/structurizr"
}
