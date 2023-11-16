# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-killswitch-network-manager
_gitpkgname=python-proton-vpn-killswitch-network-manager
pkgver=0.2.0
pkgrel=4
pkgdesc="The proton-vpn-killswitch-network-manager component is the implementation of the proton-vpn-killswitch interface using Network Manager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-killswitch-network-manager"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-vpn-network-manager" "python-proton-vpn-killswitch")
makedepends=("python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=39d4398f169539e335c1f661e0dfc5551df0e6af")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
