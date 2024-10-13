# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-vpn-api-core
pkgver=0.35.5
pkgrel=1
pkgdesc="The proton-vpn-core-api acts as a facade to the other Proton VPN components, exposing a uniform API to the available Proton VPN services."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-vpn-api-core"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')
replaces=(
	"python-proton-vpn-connection"
	"python-proton-vpn-killswitch"
	"python-proton-vpn-logger"
	"python-proton-vpn-session"
)
conflicts=(
	"python-proton-vpn-connection"
	"python-proton-vpn-killswitch"
	"python-proton-vpn-logger"
	"python-proton-vpn-session"
)
build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
