_pkgname=asgi-csrf
pkgname=python-${_pkgname}
pkgver=0.9
pkgrel=1
pkgdesc="ASGI middleware for protecting against CSRF attacks"
arch=("any")
url="https://github.com/simonw/asgi-csrf"
license=("Apache")
depends=("python-itsdangerous" "python-python-multipart")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("6e9d3bddaeac1a8fd33b188fe2abc8271f9085ab7be6e1a7f4d3c9df5d7f741a")

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
