# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=('python-snuggs')
_module='snuggs'
pkgver='1.4.1'
pkgrel=1
pkgdesc="Snuggs are s-expressions for Numpy"
url="https://github.com/mapbox/snuggs"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/s/$_module/$_module-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

sha256sums=('e1d3c9364cec1b1b938627ebfc74f040be66711072d3ae754d844b9435f4940c')
