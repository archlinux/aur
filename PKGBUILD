# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="7.171.0"
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
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.171.0/fbe9e7d/sfdx-v7.171.0-fbe9e7d-linux-x64.tar.gz")
source_arm=("https://developer.salesforce.com/media/salesforce-cli/sfdx/versions/7.171.0/fbe9e7d/sfdx-v7.171.0-fbe9e7d-linux-arm.tar.gz")

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sfdx_dir="sfdx"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
    ln -s /opt/sfdx-cli/bin/sf "${pkgdir}"/usr/bin/sf
}
sha256sums_x86_64=("2984669afdb210381205b4ae75b9c11058b4ecb46e746f2b72ec032bd7bc883c")
sha256sums_arm=("ffea0f9d3449ae2e74b8f0503014eee7a94e53836eeb6a79abef7b71b053032e")
