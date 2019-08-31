# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-varint
_name=varint
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple Python varint implementation"
arch=('any')
url="https://pypi.python.org/pypi/varint"
license=('MIT')
depends=('python'
         'python-setuptools'
        )
source=("https://pypi.io/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('a6ecc02377ac5ee9d65a6a8ad45c9ff1dac8ccee19400a5950fb51d594214ca5')
