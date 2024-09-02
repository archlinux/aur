# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=gdtoolkit
pkgname=python-${_pkgname}
pkgver=4.3.1
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
sha256sums=('199a7291a40c4358b4344758815cc35a4f8e4f55d99b53668c8f67758c0b88cd')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
