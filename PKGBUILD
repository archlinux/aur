# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=exceptiongroup
pkgname=python-${_name}
pkgver=1.0.0rc7
pkgrel=1
pkgdesc="Backport of PEP 654 (exception groups)"
arch=('any')
url="https://github.com/agronholm/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-pip')
_wheelname="${_name/-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_wheelname}")
sha256sums=('82dc1cfc21bb5f921a25925e80ec696c71b7d108c6c63bd8a786abe2b73c3263')


package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location "${_wheelname}"
}
