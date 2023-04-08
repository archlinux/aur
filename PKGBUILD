# Maintainer: Jianchen YANG <farseerfc@gmail.com>

pkgname=python-justbytes
_pkgname=justbytes
pkgver=0.15
pkgrel=4
pkgdesc="computing with and displaying bytes"
url="https://pypi.org/project/justbytes/"
depends=('python' 'python-justbases')
checkdepends=('python-nose' 'python-hypothesis' 'python-pylint')
makedepends=('python-setuptools')
license=('GPL2' 'GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mulkieran/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d6ab4ee02b60e03d7bc442c34203ea8398f0c305220d8e26ca00124c8186f84e')

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
