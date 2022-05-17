# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=exceptiongroup
pkgname=python-${_name}
pkgver=1.0.0rc6
pkgrel=1
pkgdesc="Backport of PEP 654 (exception groups)"
arch=('any')
url="https://github.com/agronholm/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-pip')
_wheelname="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_wheelname}")
sha256sums=('1ce181e67ce038f3a187f003df3e744d653c8e5bae1387e405003cac2c7d0c97')


package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location "${_wheelname}"
}
