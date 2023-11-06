# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-api-core
_gitpkgname=python-proton-vpn-api-core
pkgver=0.20.1
pkgrel=4
pkgdesc="The proton-vpn-core-api acts as a facade to the other Proton VPN components, exposing a uniform API to the available Proton VPN services."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-api-core"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-psutil")
makedepends=("python-setuptools")
#source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#tag=${pkgver}")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=9c03fc30d3ff08559cab3644eadde027b029375d")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
