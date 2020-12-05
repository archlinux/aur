# Maintainer: Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-ng
pkgver=2.2.6
pkgrel=1
pkgdesc="A Linux CLI for ProtonVPN."
arch=("any")
url="https://github.com/ProtonVPN/linux-cli"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools" "python-docopt" "python-requests" "python-jinja")
replaces=("protonvpn-cli")
source=("https://github.com/ProtonVPN/linux-cli/archive/v2.2.6.tar.gz")
sha256sums=('01ff05c9e6c174c7879553310d15bd0bcaf31e62be8c7f9a8c01b434a7c2612e')

_protonvpn_src_dir="linux-cli-2.2.6"

package() {
    # Define paths
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"
  
    # Install protonvpn-cli-ng package
    cd "${_protonvpn_src_dir}"
    python setup.py install --optimize=1 --root="$pkgdir" 

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
