# Maintainer: Jamie Smith <aur at jsmith dot dev>

pkgname=sf-cli
pkgver="2.23.20"
pkgrel=1
_dirname="${pkgname}-v${pkgver}"
pkgdesc="a tool for creating and managing Salesforce DX projects from the command line"
arch=('x86_64' 'arm')
url="https://developer.salesforce.com/tools/sfcli"
license=('unknown')
optdepends=('gnome-keyring: saving default credentials')
provides=('sf-cli')
options=(!strip)
conflicts=()
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sf/versions/2.23.20/50cd2d8/sf-v2.23.20-50cd2d8-linux-x64.tar.gz")
source_arm=("https://developer.salesforce.com/media/salesforce-cli/sf/versions/2.23.20/50cd2d8/sf-v2.23.20-50cd2d8-linux-arm.tar.gz")

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sf_dir="sf"
    cp -a "${sf_dir}" "${pkgdir}"/opt/sf-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
    ln -s /opt/sfdx-cli/bin/sf "${pkgdir}"/usr/bin/sf
}
sha256sums_x86_64=("fbbe86be0471d5e9f3c1284d84eccfe5a828084f9d68217d01239baa4b96b22e")
sha256sums_arm=("191ef3dd3bc77dadc209d195a23716cdd9b475099fde8422783fe36636209b15")
