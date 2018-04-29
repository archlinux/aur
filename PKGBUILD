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
md5sums=('4a95ae09f6ed2735ea00210b5c6a6b21')
sha256sums=('34b59a17b4885090827e647cfd103c44b2fa54382d9eed6d903dfc83ee4eceb5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
