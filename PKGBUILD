# Maintainer: heitzmann <heitzmann@gmail.com>
pkgname=python-toptica-lasersdk
_name=${pkgname#python-}
pkgver=3.0.1
pkgrel=0
pkgdesc="Easy control of TOPTICA laser products using Python"
arch=('any')
url='https://toptica.github.io/python-lasersdk/'
license=('MIT')
depends=('python-pyserial')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('b465b9f6787135e6a44b2eb88771bd047b7d4094ca4f59121d1452a32aa1cf06')

build() {
    cd "${_name/-/_}-$pkgver"
    python setup.py build
}

package() {
    cd "${_name/-/_}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
