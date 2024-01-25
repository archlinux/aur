# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-network-manager
_gitpkgname=python-proton-vpn-network-manager
pkgver=0.3.3
pkgrel=1
pkgdesc="The proton-vpn-network-manager component provides the necessary functionality for other components to interact with NetworkManager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-network-manager"
license=("GPL3")
groups=("ProtonVPN")
optdepends=("network-manager-applet: password prompt on Gnome and other GTK DEs"
						"plasma-nm: password prompt on KDE Plasma")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=0bf750e84a01ecab1844ac1400420e522ff2d839")
sha256sums=('SKIP')
conflicts=('python-protonvpn-nm-lib')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
