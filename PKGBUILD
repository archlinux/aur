# vim: set ts=4 sw=4 sts=4 et:
# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

pkgname=python-pawk
pkgver=0.6
pkgrel=1
pkgdesc="A Python line-processor (like awk) based on pyline."
arch=('any')
url='https://github.com/alecthomas/pawk'
license=('PSF')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/alecthomas/pawk/archive/v${pkgver}.tar.gz")
sha256sums=('e5029c57e334953a39f2023d8c6f29d954a4c6f15d509479b5a64b679fd45a97')

build() {
    cd "$srcdir/pawk-$pkgver"
    python setup.py build
}

check() {
    cd "$srcdir/pawk-$pkgver"
    python setup.py test
}

package_python-pawk() {
    cd "$srcdir/pawk-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir"
}

