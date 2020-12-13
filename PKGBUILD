_pkgname=asgi-csrf
pkgname=python-${_pkgname}
pkgver=0.7.1
pkgrel=1
pkgdesc="ASGI middleware for protecting against CSRF attacks"
arch=("any")
url="https://github.com/simonw/asgi-csrf"
license=("Apache")
depends=("python-itsdangerous" "python-python-multipart")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("77bfb2a3311643fd2304d0f11f72160559acbbd1a35730a54208135ded3f21a3")

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
}
