# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=gaphas
pkgname=python-${_name}
pkgver=3.5.1
pkgrel=1
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
sha256sums=('7de4118383785698a6c7a97b2324f09c01b43fe51a5ad477feeb7f2115dc35d2')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_wheelname}"
	rm -f "${pkgdir}"/usr/lib/python*/site-packages/gaphas-*.dist-info/direct_url.json
}

