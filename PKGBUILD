# Maintainer: exprez135 <exprez135 at latour dot 33mail dot com>

pkgname=protonvpn-cli-ng
pkgver=2.1.2
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

_protonvpn_src_dir="protonvpn-cli-ng"

package() {
    # Define paths
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"
  
    # Install protonvpn-cli-ng package
    cd "${_protonvpn_src_dir}"
    python setup.py install --optimize=1 --root="$pkgdir" 

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
