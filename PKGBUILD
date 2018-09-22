# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="6.34.0_6fec0d751a"
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
source_i686=("https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-v6.34.0-6fec0d751a-linux-x86.tar.xz")
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-v6.34.0-6fec0d751a-linux-x64.tar.xz")

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
    sfdx_dir="sfdx-cli-v"6.34.0-6fec0d751a"-linux-${_arch}"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
}
sha256sums_i686=("bad75a40c41c688d6ced1bf93c5062f8555a1cc0085845b25f2d8940fd520c38")
sha256sums_x86_64=("0379d8e4409990372568601f38d51d8c5e841f5a8e22e006332f13ebfb3e0e69")
