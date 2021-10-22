# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="7.123.0"
pkgrel=1
_dirname="${pkgname}-v${pkgver}"
pkgdesc="a tool for creating and managing Salesforce DX projects from the command line"
arch=('x86_64')
url="https://developer.salesforce.com/tools/sfdxcli"
license=('unknown')
optdepends=('gnome-keyring: saving default credentials')
provides=('sfdx-cli')
options=(!strip)
conflicts=()
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.123.0/ebc9b0f/sfdx-v7.123.0-ebc9b0f-linux-x64.tar.gz")

package() {
    _arch="x64"
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sfdx_dir="sfdx"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
    ln -s /opt/sfdx-cli/bin/sf "${pkgdir}"/usr/bin/sf
}
sha256sums_x86_64=("62b44d6a554692d70ec7ba2adcd3a9d3e5e1b6bfdba158d6acd8207268646429")
