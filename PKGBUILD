# Maintainer: Nate Ijams ~ exprez135 <sbk at sbk dot sh> 

pkgname=protonvpn-cli-ng
pkgver=2.2.11
pkgrel=2
pkgdesc="A Community Linux CLI for ProtonVPN."
arch=("any")
url="https://github.com/ProtonVPN/linux-cli-community"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools"
	"python-docopt" "python-requests" "python-jinja" "python-distro")
conflicts=("protonvpn-cli")
source=("https://github.com/ProtonVPN/linux-cli-community/archive/refs/tags/v${pkgver}.tar.gz")
source=("linux-cli-community-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2fc643762e9156928b706c31a7826427a7ca12c7ae4cdfb656746cd2de3af66b')

_protonvpn_src_dir="linux-cli-community-${pkgver}"

package() {
    # Define paths
    _protonvpn_src_dir="${srcdir}/${_protonvpn_src_dir}"
  
    # Install protonvpn-cli-ng package
    cd "${_protonvpn_src_dir}"
    python setup.py install --optimize=1 --root="$pkgdir" 

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
