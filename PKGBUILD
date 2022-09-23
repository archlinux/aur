# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="7.169.1"
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
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.169.1/15b850c/sfdx-v7.169.1-15b850c-linux-x64.tar.gz")
source_arm=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.169.1/15b850c/sfdx-v7.169.1-15b850c-linux-arm.tar.gz")

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sfdx_dir="sfdx"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
    ln -s /opt/sfdx-cli/bin/sf "${pkgdir}"/usr/bin/sf
}
sha256sums_x86_64=("84fcbeaabf0c145f58483726b7295f9c5799301fb0bdd0b26e53b56cedf09602")
sha256sums_arm=("a97b0432973f5a27a0a091dbff8ae0dd818e368e53f7997a917c935b5940c9a0")
