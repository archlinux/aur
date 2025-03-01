# Maintainer: William Tang <ttc0419@outlook.com>

pkgname=python-traceback-with-variables
pkgver=2.2.0
pkgrel=1
pkgdesc='Adds variables to python traceback'
arch=('any')
url='https://github.com/andy-landy/traceback_with_variables'
license=('MIT')

depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/andy-landy/traceback_with_variables/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17fe53cde1ab0b0d8e0c22c83760019fb57b84881ffdca60463b581a3920390d')

build() {
    cd "traceback_with_variables-${pkgver}"
    python setup.py build
}

package() {
    cd "traceback_with_variables-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
