# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-network-manager
_gitpkgname=python-proton-vpn-network-manager
pkgver=0.3.0
pkgrel=2
pkgdesc="The proton-vpn-network-manager component provides the necessary functionality for other components to interact with NetworkManager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-network-manager"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-psutil")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#tag=${pkgver}")
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
