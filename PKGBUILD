# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=gdtoolkit
pkgname=python-${_pkgname}
pkgver=3.4.0
pkgrel=1
pkgdesc='Independent set of tools for working with GDScript - parser, linter and formatter'
arch=(any)
url='https://github.com/Scony/godot-gdscript-toolkit'
license=(MIT)
depends=(python python-docopt python-lark-parser python-yaml python-radon)
makedepends=(python-setuptools)
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8a6296a5f61e91ad9f625edd16096703140a068d3d012cf19006436059d14882')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
