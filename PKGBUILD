# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-network-manager
pkgver=0.4.2
pkgrel=2
pkgdesc="The proton-vpn-network-manager component provides the necessary functionality for other components to interact with NetworkManager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-network-manager"
license=("GPL3")
groups=("ProtonVPN")
optdepends=("network-manager-applet: password prompt on Gnome and other GTK DEs"
			"plasma-nm: password prompt on KDE Plasma")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('66028a42f0b468ba1d5e37a6594803a0494f0eae6f07b9137b8f48aa75ea7c44')
conflicts=('python-protonvpn-nm-lib')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
