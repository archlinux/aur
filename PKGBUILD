# Maintainer: Tom Knight-Markiegi <tom.knight@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>

pkgname=structurizr-cli
pkgver=1.19.0
pkgrel=2
pkgdesc="A command line utility for Structurizr"
arch=(any)
url="https://github.com/structurizr/cli"
license=('apache')
depends=('java-runtime')
makedepends=()
source=("https://github.com/structurizr/cli/releases/download/v${pkgver}/structurizr-cli-${pkgver}.zip" "launcher.sh")
sha256sums=('aad505e9e48b89a30fe411990981205433bb650e4148ca2f5d877477c80fe42d'
            'd360ef7d8ac0106c3e735d3f74628ed24e6604ad7bc254d4b85a49a5b933bf27')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/opt/structurizr-cli"
    mkdir -p "${pkgdir}/usr/bin"
    cp -R "lib" "${pkgdir}/opt/structurizr-cli/lib"
    cp "structurizr.sh" "${pkgdir}/opt/structurizr-cli/structurizr.sh"
    chmod +x "${pkgdir}/opt/structurizr-cli/structurizr.sh"
    cp launcher.sh "${pkgdir}/usr/bin/structurizr"
    chmod +x "${pkgdir}/usr/bin/structurizr"
}
