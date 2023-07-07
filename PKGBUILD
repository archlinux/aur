# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="7.208.10"
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
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.208.10/178b759/sfdx-v7.208.10-178b759-linux-x64.tar.gz")
source_arm=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.208.10/178b759/sfdx-v7.208.10-178b759-linux-arm.tar.gz")

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sfdx_dir="sfdx"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
    ln -s /opt/sfdx-cli/bin/sf "${pkgdir}"/usr/bin/sf
}
sha256sums_x86_64=("efc0500f8c5a28d6b866236150c7848d94dbd51c08c6db4b741a5220c27185d3")
sha256sums_arm=("ee537a1063fe992e446c1206d09f85cadbfe351495540a3e3f5040a7e2025bf2")
