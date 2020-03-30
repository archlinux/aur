# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=generic
pkgname=python-${_name}
pkgver=1.0.0
pkgrel=1
pkgdesc="Library for Generic programming, also known as Multiple dispatch"
arch=('any')
url="https://github.com/gaphor/generic"
license=('BSD')
depends=('python')
makedepends=('python-pip')
_wheelname="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_wheelname}")
sha256sums=('a8dbb3133929223149272fcc70a95967cf3b24e3fa12601f91c67fb61efe29d4')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_wheelname}"
}

