# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shandy-sqlfmt"
_pkgname="${pkgname/python-/}"
pkgver=0.21.2
pkgrel=1
pkgdesc="An opinionated CLI tool that formats your SQL files"
url="https://pypi.org/project/shandy-sqlfmt/"
license=("Apache-2.0")
arch=("any")
depends=("python"
         "python-click"
         "python-tqdm"
         "python-platformdirs"
         "python-backports.cached_property"
         "python-tomli"
         "python-black"
         "python-gitpython"
         "flake8"
         "python-isort"
         "mypy"
        )
makedepends=("python-build"
             "python-installer"
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('58b2c36ec34aed411ec855765b03789f3ce1056ccae35b444c9c18906fc071c91b2a5ba9fe2825f885fd6eb78603ff0e96fbd64e159c967741f326b2292222a4')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
