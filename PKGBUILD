# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbytes
_pkgname=justbytes
pkgver=0.15.2
pkgrel=1
pkgdesc="computing with and displaying bytes"
url="https://pypi.org/project/justbytes/"
depends=('python' 'python-justbases')
checkdepends=('python-pytest' 'python-hypothesis' 'python-pylint')
makedepends=('python-setuptools')
license=('GPL2' 'GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('125af80a9b36d834080ec8356ed43a38061cf4208b2d781aa24ee8b0ca9782d1')

check() {
    cd "$srcdir/${_pkgname}-$pkgver"
    PYTHONPATH=src pytest
}

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
