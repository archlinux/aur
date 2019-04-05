# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-bencode.py
_pkgname=bencode.py
pkgver=2.0.0
pkgrel=1
pkgdesc='Simple bencode parser (for Python 2, Python 3 and PyPy)'
arch=('any')
url="https://github.com/fuzeman/bencode.py"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
#source=("https://github.com/fuzeman/bencode.py/archive/${pkver}.tar.gz")

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('067cf936e29a7b698d2b4d00902343b78d434d73d837c33d6ca1a8be6038fe72')
