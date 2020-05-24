# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-pytest-cid
_name=pytest_cid
pkgver=1.0.0
pkgrel=1
pkgdesc="A wrapper around py-cid for writing tests involving CIDs in datastructures."
arch=('any')
url="https://pypi.python.org/pypi/pytest_cid"
license=('MIT')
depends=('python'
         'python-setuptools'
         'python-cid'
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

sha256sums=('61a1c282220ad1ad419cbfce7c33b3a84781be7a9edae9145da924ab2aaccfe8')
