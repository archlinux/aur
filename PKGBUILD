# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=gaphas
pkgname=python-${_name}
pkgver=3.6.0
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
sha256sums=('1b823a6af4baad4f4bb308f1a45e3bcf5722f26f7409deb436ffce06fcd76c6e')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_wheelname}"
	rm -f "${pkgdir}"/usr/lib/python*/site-packages/gaphas-*.dist-info/direct_url.json
}

