# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbytes
_pkgname=justbytes
pkgver=0.14
pkgrel=3
pkgdesc="computing with and displaying bytes"
url="https://pypi.org/project/justbytes/"
depends=('python' 'python-justbases')
checkdepends=('python-nose' 'python-hypothesis' 'python-pylint')
makedepends=('python-setuptools')
license=('GPL2' 'GPL3')
arch=('any')
source=("https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('3b9a26069421b1be24782f51125befa0')

check() {
    cd "$srcdir/${_pkgname}-$pkgver"
    nosetests
}

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
