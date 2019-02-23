# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="6.54.4_c01dcc69db"
pkgrel=1
_dirname="${pkgname}-v${pkgver}"
pkgdesc="a tool for creating and managing Salesforce DX projects from the command line"
arch=('i686' 'x86_64')
url="https://developer.salesforce.com/tools/sfdxcli"
license=('unknown')
optdepends=('gnome-keyring: saving default credentials')
provides=('sfdx-cli')
options=(!strip)
conflicts=()
source_i686=("https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-v6.54.4-c01dcc69db-linux-x86.tar.xz")
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-v6.54.4-c01dcc69db-linux-x64.tar.xz")

package() {
    _arch=""
    case $CARCH in
        "x86_64")
            _arch="x64"
            ;;
        "i686")
            _arch="x86"
            ;;
    esac

    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    sfdx_dir="sfdx-cli-v"6.54.4-c01dcc69db"-linux-${_arch}"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
}
sha256sums_i686=("593c0dc9f278c5d4a983170e1d72d2cfa88ead0f746d24c8b94ec76022040ab6")
sha256sums_x86_64=("50f3cae2bc643ba7410cbeae931b4421b7bb84f60316cba025852e7fa1079484")
