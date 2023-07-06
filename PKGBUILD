# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=requirements-language-server
pkgname="python-$_pkgname"
pkgver=0.0.4
pkgrel=1
pkgdesc="requirements language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-pygls python-platformdirs python-jinja pip-cache pip-tools)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('b29b4861c432ad5f1d8c9a19d5e285e6077c37de3972f8384c8b782cd4f7f2ac')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
