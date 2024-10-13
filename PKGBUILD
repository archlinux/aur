# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-network-manager
pkgver=0.9.1
pkgrel=1
pkgdesc="The proton-vpn-network-manager component provides the necessary functionality for other components to interact with NetworkManager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-network-manager"
license=("GPL3")
groups=("ProtonVPN")
optdepends=("network-manager-applet: password prompt on Gnome and other GTK DEs"
			"plasma-nm: password prompt on KDE Plasma")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')
depends=('networkmanager-openvpn')
conflicts=("python-protonvpn-nm-lib"
	   "python-proton-vpn-killswitch-network-manager"
	   "python-proton-vpn-killswitch-network-manager-wireguard" 
	   "python-proton-vpn-network-manager-wireguard"
	   "python-proton-vpn-network-manager-openvpn")

replaces=("python-proton-vpn-killswitch-network-manager"
	  "python-proton-vpn-killswitch-network-manager-wireguard"
	  "python-proton-vpn-network-manager-wireguard"
	  "python-proton-vpn-network-manager-openvpn")

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
