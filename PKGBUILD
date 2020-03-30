# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=gaphas
pkgname=python-${_name}
pkgver=2.0.0
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
sha256sums=('721888ed6eae2539fffc0a34f10a6593904223b2b334052808f5e799480d96ee')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_wheelname}"
}

