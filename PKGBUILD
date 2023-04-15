# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="7.196.8"
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
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.196.8/16a11d1/sfdx-v7.196.8-16a11d1-linux-x64.tar.gz")
source_arm=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.196.8/16a11d1/sfdx-v7.196.8-16a11d1-linux-arm.tar.gz")

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sfdx_dir="sfdx"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
    ln -s /opt/sfdx-cli/bin/sf "${pkgdir}"/usr/bin/sf
}
sha256sums_x86_64=("0ca628029a8e6ab80465818867cdad48f0bb9819162adf1920923eecc105bb10")
sha256sums_arm=("404076df5a9d8bb2d692de6d509131c0b49fd34c4a8b5a3548ecc852f2c8c635")
