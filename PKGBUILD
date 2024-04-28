# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-connection
pkgver=0.14.4
pkgrel=2
pkgdesc="The proton-vpn-connection component defines the interface that VPN connection backends should implement."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-connection"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('8f5502dfb3888bcd99b27d08ffa16444689456d354fd59bf6a3f33c542917928')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
