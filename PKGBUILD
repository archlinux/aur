# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.18.0
pkgrel=2
pkgdesc="An implementation of the Language Server Protocol for Python"
arch=("any")
url="https://github.com/palantir/${pkgname}"
license=("MIT")
depends=("python" "python-json-rpc" "python-future" "python-jedi" "python-pluggy")
optdepends=(
    "python-mccabe: for complexity checking"
    "python-rope: for completions and renaming"
    "python-pyflakes: for linter to detect various errors"
    "python-pycodestyle: for style checking"
    "autopep8: for code formatting"
    "yapf: for code formatting (preferred over autopep8)"
    "pydocstyle: for docstring style checking"
)
makedepends=("python-setuptools")  
conflicts=("${pkgname}" "${pkgname}-git")
# install=$pkgname.install
source=("https://github.com/palantir/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7081b960ec3418956a98aed75f08f26a')
sha256sums=('c7b6febf9e853f2a68903f8f7835b789072b09ebc48d71d24d75f951ddec11f9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
