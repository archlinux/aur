# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-coincurve
_pkgname=coincurve
pkgver=15.0.0
pkgrel=1
pkgdesc='Cross-platform Python CFFI bindings for libsecp256k1'
arch=('any')
url="https://github.com/ofek/coincurve"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
#source=("https://github.com/ofek/${_pkgname}/archive/${pkver}.tar.gz")

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('06524b11edb9427dc34cfdb5cd4bb707bf2c874b8bb901ce8c3aad48163e5a65')
