# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=requirements-language-server
pkgname="python-$_pkgname"
pkgver=0.0.2
pkgrel=1
pkgdesc="requirements language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-pygls python-platformdirs python-jinja pip-cache pip-tools)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('1a142ff77fc1d2c2b2552e42caedb8f51a8fddfa9cf538386e85a873cef7b735')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
