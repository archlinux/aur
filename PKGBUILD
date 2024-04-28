# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-core
pkgver=0.1.16
pkgrel=3
pkgdesc="The proton-core component contains core logic used by the other Proton components."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-core"
license=("GPL3")
groups=("ProtonVPN")
makedepends=("git" "python-setuptools")
source=("git+https://github.com/ProtonVPN/${pkgname}.git#tag=v${pkgver}")
sha256sums=('266d69691dafb6d2d6010c959850372467dc56410960757881e864362e064240')

build() {
	cd "$pkgname"
    python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
}
