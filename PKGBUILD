# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shandy-sqlfmt"
_pkgname="${pkgname/python-/}"
pkgver=0.32.0
pkgrel=1
pkgdesc="An opinionated CLI tool that formats your SQL files"
url="https://pypi.org/project/shandy-sqlfmt/"
license=("Apache-2.0")
arch=("any")
depends=("python"
         "python-click"
         "python-tqdm"
         "python-platformdirs"
         "python-tomli"
         "python-black"
         "python-gitpython"
         "python-isort"
         "python-jinja"
         "python-importlib-metadata"
         "mypy"
        )
makedepends=("python-build"
             "python-installer"
             "python-hatchling"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('9120db43b68971bad4bbc1a6fc5760648dcf6d1190403f90e2d7302dffc90c34e5fa477309391779d7b5de47ba813f48d7cb601c54c8b7efdd7d93a6dc32862b')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
