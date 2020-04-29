# Maintainer: Nate Ijams ~ exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-ng
pkgver=2.2.2
pkgrel=2
pkgdesc="ProtonVPN CLI tool for protonvpn.com"
arch=("any")
url="https://github.com/ProtonVPN/linux-cli"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools" "python-docopt" "python-requests")
replaces=("protonvpn-cli")
source=("https://github.com/ProtonVPN/linux-cli/archive/v2.2.2.tar.gz")
sha256sums=('7d4d8c10e8c05626a17bfc901b287b847944ae1c0d09859ef6c3992c924a114f')

_protonvpn_src_dir="linux-cli-2.2.2"

package() {
    # Define paths
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"
  
    # Install protonvpn-cli-ng package
    cd "${_protonvpn_src_dir}"
    python setup.py install --optimize=1 --root="$pkgdir" 

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
