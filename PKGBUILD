# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=structurizr-cli
pkgver=1.12.0
pkgrel=1
pkgdesc="A command line utility for Structurizr"
arch=(any)
url="https://github.com/structurizr/cli"
license=('apache')
depends=('java-runtime')
makedepends=()
source=("https://github.com/structurizr/cli/releases/download/v${pkgver}/structurizr-cli-${pkgver}.zip" "launcher.sh")
sha256sums=('69c3995531256282e0da7c366e87dd7dc84f4c07ce70760736e4ed0d6001c347'
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
