# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=gaphas
pkgname=python-${_name}
pkgver=2.1.2
pkgrel=2
pkgdesc="Diagramming widget library for Python"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('Apache')
depends=(
	'python-gobject'
	'python-cairo'
	'python-importlib-metadata'
)
makedepends=('python-pip')
_wheelname="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_wheelname}")
sha256sums=('8614233101867319e98adf261101d7069d3730b9b0b6c1b38deaea7d9e7e1358')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_wheelname}"
	rm "${pkgdir}"/usr/lib/python*/site-packages/gaphas-*.dist-info/direct_url.json
}

