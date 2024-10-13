# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux
pkgver=0.1.0
pkgrel=1
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
sha256sums=('SKIP')
conflicts=('python-proton-keyring-linux-secretservice')
replacess=('python-proton-keyring-linux-secretservice')
build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
