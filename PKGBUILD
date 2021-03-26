# Maintainer: Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-ng
pkgver=2.2.6
pkgrel=2
pkgdesc="A Linux CLI for ProtonVPN."
arch=("any")
url="https://github.com/ProtonVPN/linux-cli-community"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools" "python-docopt" "python-requests" "python-jinja")
replaces=("protonvpn-cli")
source=("https://github.com/ProtonVPN/linux-cli-community/archive/v2.2.6.tar.gz")
sha256sums=('eb7e334ea55f510fdcda44541714ee4c03b7d00a23228ee5e18d37863b243d72')

_protonvpn_src_dir="linux-cli-community-2.2.6"

package() {
    # Define paths
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"
  
    # Install protonvpn-cli-ng package
    cd "${_protonvpn_src_dir}"
    python setup.py install --optimize=1 --root="$pkgdir" 

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
