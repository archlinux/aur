# Maintainer: Dang Mai <contact at dangmai dot net>

pkgname=sfdx-cli
pkgver=6.0.16_3780698
pkgrel=1
_dirname="${pkgname}-v${pkgver}"
pkgdesc="a tool for creating and managing Salesforce DX projects from the command line"
arch=('i686' 'x86_64')
url="https://developer.salesforce.com/tools/sfdxcli"
license=('unknown')
optdepends=()
provides=('sfdx-cli')
conflicts=()
source_i686=("https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz")
source_x86_64=("https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-386.tar.xz")

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

    install -dm 755 "${pkgdir}"/opt/
    install -dm 755 "${pkgdir}"/usr/bin
    pwd
    install -D sfdx/bin/sfdx "${pkgdir}"/opt/sfdx-cli/sfdx

    # cp -R "${_dirname}-${_arch}" "${pkgdir}"/opt/heroku-cli
    ln -s /opt/sfdx-cli/sfdx "${pkgdir}"/usr/bin/sfdx
}
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
