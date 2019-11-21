# Maintainer: exprez135 <exprez135 at latour dot 33mails dot com>

pkgname=protonvpn-cli-ng
pkgver=2.1.1
pkgrel=1
pkgdesc="ProtonVPN CLI tool for protonvpn.com"
arch=("any")
url="https://github.com/ProtonVPN/protonvpn-cli-ng"
license=("GPLv3")
depends=("openvpn" "python3" "dialog")
makedepends=("git")
replaces=("protonvpn-cli")
source=("git+https://github.com/ProtonVPN/protonvpn-cli-ng.git")
md5sums=("SKIP")

# _update_resolv_conf_src_dir="openvpn-update-resolv-conf"
_protonvpn_src_dir="protonvpn-cli-ng"

package() {
    # Define paths
    # _update_resolv_conf_src_dir="${srcdir}/${_update_resolv_conf_src_dir}"
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"

  
    # Install protonvpn-cli-ng package
    cd "${_protonvpn_src_dir}"
    sudo pip3 install .

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
