# Maintainer: Francesco Zardi <frazar0 [at] hotmail _dot_ it>
# Contributor: Tom Knight-Markiegi <tom.knight@gmail.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
_pkgname=structurizr
pkgname=$_pkgname-cli
pkgver=2024.03.03
pkgrel=1
pkgdesc="A command line utility for Structurizr"
arch=(any)
url="https://github.com/$_pkgname/cli"
license=('apache')
depends=('bash' 'java-runtime')
makedepends=()
source=("https://github.com/$_pkgname/cli/releases/download/v${pkgver}/$_pkgname-cli.zip"
        "launcher.sh")
sha256sums=('76a48bee2016d851a0737bffbbf9aae00d2043e96e1b746ffb7e189ca917b264'
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
