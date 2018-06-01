# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver="6.18.0_1b04f64ef1"
pkgrel=1
_dirname="${pkgname}-v${pkgver}"
pkgdesc="a tool for creating and managing Salesforce DX projects from the command line"
arch=('i686' 'x86_64')
url="https://developer.salesforce.com/tools/sfdxcli"
license=('unknown')
optdepends=()
provides=('sfdx-cli')
conflicts=()
source_i686=("https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-v6.18.0-1b04f64ef1-linux-x86.tar.xz")
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-v6.18.0-1b04f64ef1-linux-x64.tar.xz")

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
    sfdx_dir="sfdx-cli-v"6.18.0-1b04f64ef1"-linux-${_arch}"
    cp -a "${sfdx_dir}" "${pkgdir}"/opt/sfdx-cli
    ln -s /opt/sfdx-cli/bin/sfdx "${pkgdir}"/usr/bin/sfdx
}
sha256sums_i686=("da0122d5830adad3a37c81845261f1ccfbec0d3f06af802a407eb82aee2a060f")
sha256sums_x86_64=("efc9ca724bd0fc2f00c1e1490380e1eaab61854400150559303fc23f595a498d")
