# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=requirements-language-server
pkgname="python-$_pkgname"
pkgver=0.0.3
pkgrel=1
pkgdesc="requirements language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-pygls python-platformdirs python-jinja pip-cache pip-tools)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('fa5e92963b7160c98490cdd1c744f9c0a2d9fa4ddbc9f43923f366f778808c23')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
