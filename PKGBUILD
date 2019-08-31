# Maintainer: redfish <redfish@galactica.pw>

pkgname=python-coincurve
_pkgname=coincurve
pkgver=12.0.0
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

sha256sums=('901009df491ff042e666f0b1afa9b40ffd9db0608be7ced4f5572e068d933dbb')
