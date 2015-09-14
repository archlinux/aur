# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-btctxstore
_pkgname=${pkgname/python-/}
pkgver=4.6.0
pkgrel=1
pkgdesc="A library to read/write data to bitcoin transactions as nulldata outputs"
url="https://github.com/Storj/btctxtore"
depends=('python' 'python-pip' 'python-pycoin' 'python-six' 'python-ecdsa')
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/b/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ad059fcf899591e6f75fb1dd374157eb04ac895df6e7a18724589076ed3df78ed2c0c71d69cbe9d8f044e39570447ba31415fa7d9d80cbfaf5cba513a6d55370')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}
