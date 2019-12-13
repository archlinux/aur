# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-coincurve
_pkgname=coincurve
pkgver=13.0.0
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

sha256sums=('9985627dc0c81fe98c3d2e97412801e9726d6110249317a2775cf365f0ba0df5')
