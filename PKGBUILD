# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-network-manager-openvpn
pkgver=0.0.7
pkgrel=2
pkgdesc="The proton-vpn-network-manager-openvpn component adds support for the OpenVPN protocol using NetworkManager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-network-manager-openvpn"
license=("GPL3")
groups=("ProtonVPN")
depends=("networkmanager-openvpn")
makedepends=("git" "python-setuptools" "python-proton-vpn-network-manager")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('21dd952a6e58412c40552f689f2cd9a81ebb44f730d11a412738d99afc6954ae')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
