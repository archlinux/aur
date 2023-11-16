# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-network-manager-openvpn
_gitpkgname=python-proton-vpn-network-manager-openvpn
pkgver=0.0.4
pkgrel=5
pkgdesc="The proton-vpn-network-manager-openvpn component adds support for the OpenVPN protocol using NetworkManager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-network-manager-openvpn"
license=("GPL3")
groups=("ProtonVPN")
depends=("networkmanager-openvpn")
makedepends=("python-setuptools" "python-proton-vpn-network-manager")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=b79f6732646378ef1b92696de3665ff9560286d3")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
