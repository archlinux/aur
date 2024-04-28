# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux
pkgver=0.0.2
pkgrel=2
pkgdesc="The proton-keyring-linux component."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-keyring-linux"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-keyring" "org.freedesktop.secrets")
makedepends=("git" "python-setuptools")
optdepends=(
	'gnome-keyring: Gnome keyring support'
	'pass: pass support'
	'kwallet5: KDE keyring support'
)
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('d7c723397a4659e1b13ab6e3e5b7e2e629d97b57efabc8d78a1d066469ea2c40')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
