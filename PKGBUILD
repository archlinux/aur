# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shandy-sqlfmt"
_pkgname="${pkgname/python-/}"
pkgver=0.28.2
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
b2sums=('a99bdce75fbac40e7e663977dc23a7070cd7358781c253276febe0cb82075f39bf5a7e2616bc3e0a63d170ca87b906bef3d7105f59ba4a092f90ce7eccea2f1f')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
