# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-typing-extensions
pkgver=3.6.6
pkgrel=1
pkgdesc="Backported and Experimental Type Hints for Python 3.5+"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://pypi.org/project/typing-extensions"
license=('custom')
source=("https://files.pythonhosted.org/packages/fc/e6/3d2f306b12f01bde2861d67458d32c673e206d6fcc255537bf452db8f80c/typing_extensions-3.6.6.tar.gz")
sha256sums=('51e7b7f3dcabf9ad22eed61490f3b8d23d9922af400fe6656cb08e66656b701f')

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
