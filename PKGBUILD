# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-killswitch
_gitpkgname=python-proton-vpn-killswitch
pkgver=0.4.0
pkgrel=2
pkgdesc="The proton-vpn-killswitch component defines the VPN kill switch interface."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-killswitch"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-core")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#tag=v${pkgver}")
sha256sums=('63dfaa0022000e54b7f05255bc47e6af3152de643173404b95f54f7ec323e04a')

build() {
	cd "$_gitpkgname"
	python setup.py build
}

package() {
	cd "$_gitpkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
