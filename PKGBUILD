# Maintainer: fenuks

pkgname=python-language-server
pkgver=0.18.0
pkgrel=1
pkgdesc="An implementation of the Language Server Protocol for Python"
arch=("any")
url="https://github.com/palantir/${pkgname}"
license=("MIT")
depends=("python" "python-json-rpc" "python-future" "python-jedi" "python-mccabe"
    "python-pluggy" "python-pycodestyle" "python-pyflakes" "python-rope" "yapf" "pydocstyle")
# optdepends=("python-language-server-mypy: mypy type checking")
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
