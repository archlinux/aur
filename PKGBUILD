# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-killswitch-network-manager
pkgver=0.4.3
pkgrel=2
pkgdesc="The proton-vpn-killswitch-network-manager component is the implementation of the proton-vpn-killswitch interface using Network Manager."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-killswitch-network-manager"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-proton-vpn-network-manager" "python-proton-vpn-killswitch")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('7b5b34148fb4fd12b22076018d71f4286a4f327b0cf94cc58fdd18c87719d6c6')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
