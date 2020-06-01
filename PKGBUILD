# Maintainer: Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-ng
pkgver=2.2.4
pkgrel=1
pkgdesc="A Linux CLI for ProtonVPN."
arch=("any")
url="https://github.com/ProtonVPN/linux-cli"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools" "python-docopt" "python-requests" "python-jinja")
replaces=("protonvpn-cli")
source=("https://github.com/ProtonVPN/linux-cli/archive/v2.2.4.tar.gz")
sha256sums=('d7deff214118ba0b38a6eac697f8148f99b1e50e1404021b45f9f4749ea81fe8')

_protonvpn_src_dir="linux-cli-2.2.4"

package() {
    # Define paths
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"
  
    # Install protonvpn-cli-ng package
    cd "${_protonvpn_src_dir}"
    python setup.py install --optimize=1 --root="$pkgdir" 

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
