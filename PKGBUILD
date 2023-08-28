# Maintainer: Francesco Zardi <frazar0 [at] hotmail _dot_ it>
# Contributor: Tom Knight-Markiegi <tom.knight@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>

pkgname=structurizr-cli
pkgver=1.33.1
pkgrel=2
pkgdesc="A command line utility for Structurizr"
arch=(any)
url="https://github.com/structurizr/cli"
license=('apache')
depends=('bash' 'java-runtime')
makedepends=()
source=("https://github.com/structurizr/cli/releases/download/v${pkgver}/structurizr-cli-${pkgver}.zip"
        "launcher.sh")
sha256sums=('c42c32b50dedb2cb11d3960a9257e2b820bbebcc7c444fd0e147b1b896141406'
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
