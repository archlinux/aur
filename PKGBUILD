# Maintainer: Tomás Ralph <tomasralph2000@gmail.com>

pkgname=wollok-cli
pkgver=3.2.0
pkgrel=1
pkgdesc="Wollok Command Line Interface project "
arch=(any)
url="https://github.com/uqbar-project/wollok-cli"
depends=('jdk-openjdk')
source=(
    "https://github.com/uqbar-project/wollok-cli/archive/refs/tags/v${pkgver}.tar.gz"
    "wollok"
)
sha256sums=(
    '4cdc2cdfe8d4c5d5ae2b13acdffe11291348f3c7fee88705420e2a7cbdc005d3'
    '3577f7f8d0fdc6d90fb661973392591a40eac1a27de599b3e69a987542e0a11a'
)

package() {
    local installDir="${pkgdir}/opt/wollok-cli"
    install -dm0755 "$installDir"

    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wollok" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wrepl.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wsanity-check.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wserver-stop.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wserver.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/winterpreter.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wformat.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wchecker.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/wast.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/runTests.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/runPrograms.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/generateCI.sh" --target-directory "$installDir"
    install -Dm0755 "${srcdir}/wollok-cli-${pkgver}/build.sh" --target-directory "$installDir"

    chmod 755 "${srcdir}/wollok-cli-${pkgver}/util"/*.sh
    mv "${srcdir}/wollok-cli-${pkgver}/util" "$installDir"

    chmod 755 "${srcdir}/wollok-cli-${pkgver}/includes"/*.sh
    mv "${srcdir}/wollok-cli-${pkgver}/includes" "$installDir"

    mv "${srcdir}/wollok-cli-${pkgver}/jars" "$installDir"

    install -Dm0755 "${srcdir}/wollok" --target-directory "${pkgdir}/usr/bin"
}
