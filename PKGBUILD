# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=gdtoolkit
pkgname=python-${_pkgname}
pkgver=4.0.0
pkgrel=2
pkgdesc='Independent set of tools for working with GDScript - parser, linter and formatter'
arch=(any)
url='https://github.com/Scony/godot-gdscript-toolkit'
license=(MIT)
depends=(python python-docopt-ng python-lark-parser python-yaml python-radon python-regex python-six)
makedepends=(python-setuptools)
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d521e5bb99a8eab56eb7689a92b0354bd7463160ac10d5ec06f6dff08a070c54')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
