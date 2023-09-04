# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-multicodec
_name=py-multicodec
pkgver=0.2.1
pkgrel=2
pkgdesc="A self-describing multiformat, wraps other formats with self-description."
arch=('any')
url="https://pypi.python.org/pypi/py-multicodec"
license=('MIT')
depends=('python'
         'python-setuptools'
         'python-varint'
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

sha256sums=('83021ffe8c0e272d19b5b86bc5b39efa67c8e9f4735ce6cafdbc1ace767ec647')
