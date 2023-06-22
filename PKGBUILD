# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=python-traceback-with-variables
pkgver=2.0.4
pkgrel=1
pkgdesc='Adds variables to python traceback'
arch=('any')
url='https://github.com/andy-landy/traceback_with_variables'
license=('MIT')

depends=('python')
makedepends=('python-setuptools')

source=('https://github.com/andy-landy/traceback_with_variables/archive/refs/tags/v2.0.4.tar.gz')
sha256sums=('SKIP')

build() {
    cd "traceback_with_variables-${pkgver}"
    python setup.py build
}

package() {
    cd "traceback_with_variables-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
