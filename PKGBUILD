# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="7.192.2"
pkgrel=1
_dirname="${pkgname}-v${pkgver}"
pkgdesc="a tool for creating and managing Salesforce DX projects from the command line"
arch=('x86_64' 'arm')
url="https://developer.salesforce.com/tools/sfdxcli"
license=('unknown')
optdepends=('gnome-keyring: saving default credentials')
provides=('sfdx-cli')
options=(!strip)
conflicts=()
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.192.2/2a9b975/sfdx-v7.192.2-2a9b975-linux-x64.tar.gz")
source_arm=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.192.2/2a9b975/sfdx-v7.192.2-2a9b975-linux-arm.tar.gz")

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sfdx_dir="sfdx"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
    ln -s /opt/sfdx-cli/bin/sf "${pkgdir}"/usr/bin/sf
}
sha256sums_x86_64=("5429b9e996cc5f8f9f755e657d3ef514f5647dd71e68f944ac2491b0f3019b00")
sha256sums_arm=("3fe3340ba11da15b14fbae50bfd35ed928f2b72a7bffa63e0ab240ab937310e9")
