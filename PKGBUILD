# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-typing-extensions
pkgver=3.7.2
pkgrel=1
pkgdesc="Backported and Experimental Type Hints for Python 3.5+"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://pypi.org/project/typing-extensions"
license=('custom')
source=("https://files.pythonhosted.org/packages/fa/aa/229f5c82d17d10d4ef318b5c22a8626a1c78fc97f80d3307035cf696681b/typing_extensions-3.7.2.tar.gz")
sha256sums=('fb2cd053238d33a8ec939190f30cfd736c00653a85a2919415cecf7dc3d9da71')

build() {
    cd "$srcdir/typing_extensions-$pkgver"
    
    msg2 'Building...'
    python setup.py build
}

package() {
    cd "$srcdir/typing_extensions-$pkgver"

    msg2 'Installing...'
    python setup.py install --root="$pkgdir" --optimize=1
}
