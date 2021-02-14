_pkgname=asgi-csrf
pkgname=python-${_pkgname}
pkgver=0.8
pkgrel=1
pkgdesc="ASGI middleware for protecting against CSRF attacks"
arch=("any")
url="https://github.com/simonw/asgi-csrf"
license=("Apache")
depends=("python-itsdangerous" "python-python-multipart")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("312a35c73092db96fe2da325458d482954e1e3bceeac398455f0b0f3958d9620")

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
