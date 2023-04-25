# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=gdtoolkit
pkgname=python-${_pkgname}
pkgver=4.0.1
pkgrel=1
pkgdesc='Independent set of tools for working with GDScript - parser, linter and formatter'
arch=(any)
url='https://github.com/Scony/godot-gdscript-toolkit'
license=(MIT)
depends=(python python-docopt-ng python-lark-parser python-yaml python-radon python-regex python-six)
makedepends=(python-setuptools)
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1f7d4811d966c4b8c826836d4905c74e79c1af1eeed13b7f361f87a215f759e4')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
