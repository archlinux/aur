# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shandy-sqlfmt"
_pkgname="${pkgname/python-/}"
pkgver=0.28.0
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
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('87f2d17b42dd569e9d2520ca1017ab0f0f1e110751850dcf570c1ff47b0508e5edbec3c36c38e810f8c0c2b7e6ac4fb108736f762fd70f34713620781877cc6c')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
