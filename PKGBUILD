# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shandy-sqlfmt"
_pkgname="${pkgname/python-/}"
pkgver=0.29.0
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
b2sums=('610ca546eae7e60f0921d5abcbae6d252a2c43d10fc2bc0dd5dcdd7b131a420b449580196eb6006a3793564c770d1dc091c4650d2c51feafcde094308e4113f4')

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
