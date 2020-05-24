# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-cid
_name=py-cid
pkgver=0.3.0
pkgrel=1
pkgdesc="Self-describing content-addressed identifiers for distributed systems"
arch=('any')
url="https://pypi.python.org/pypi/py-cid"
license=('MIT')
depends=('python'
         'python-setuptools'
         'python-baseconv'
         'python-multibase'
         'python-morphys'
         'python-pymultihash'
         'python-multicodec'
        )
checkdepends=()
source=("https://pypi.io/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('22f432cc6fb68d12a9c35dbdc92c95484fc49e31dfcb9e0efb0082233c5394e3')
