# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=gdtoolkit
pkgname=python-${_pkgname}
pkgver=4.5.0
pkgrel=1
pkgdesc='Independent set of tools for working with GDScript - parser, linter and formatter'
arch=(any)
url='https://github.com/Scony/godot-gdscript-toolkit'
license=(MIT)
depends=(python python-setuptools python-docopt-ng python-yaml python-radon python-regex python-six python-lark-parser)
makedepends=(python-installer)
provides=()
conflicts=()
source=(
	"https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=('1ab17fb5400d86e4ae66d9c94992f4e3a9b6c27d618d4094782e66101efb3e9a')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
