# Maintainer: Francesco Zardi <frazar0 [at] hotmail _dot_ it>
# Contributor: Tom Knight-Markiegi <tom.knight@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
_pkgname=structurizr
pkgname=$_pkgname-cli
pkgver=2024.01.02
pkgrel=1
pkgdesc="A command line utility for Structurizr"
arch=(any)
url="https://github.com/$_pkgname/cli"
license=('apache')
depends=('bash' 'java-runtime')
makedepends=()
source=("https://github.com/$_pkgname/cli/releases/download/${pkgver}/$_pkgname-cli.zip"
        "launcher.sh")
        # https://github.com/$_pkgname/cli/releases/download/2024.01.02/$_pkgname-cli.zip
sha256sums=('cb904943baa6a273158d03d8e527026fff34fc71a9b4cd9a7cc0c4377f13179d'
            'd360ef7d8ac0106c3e735d3f74628ed24e6604ad7bc254d4b85a49a5b933bf27')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/opt/$_pkgname-cli"
    mkdir -p "${pkgdir}/usr/bin"
    cp -R "lib" "${pkgdir}/opt/$_pkgname-cli/lib"
    cp "$_pkgname.sh" "${pkgdir}/opt/$_pkgname-cli/$_pkgname.sh"
    chmod +x "${pkgdir}/opt/$_pkgname-cli/$_pkgname.sh"
    cp launcher.sh "${pkgdir}/usr/bin/$_pkgname"
    chmod +x "${pkgdir}/usr/bin/$_pkgname"
}
