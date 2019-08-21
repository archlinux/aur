# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-typing-extensions
pkgver=3.7.4
pkgrel=1
pkgdesc="Backported and Experimental Type Hints for Python 3.5+"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://pypi.org/project/typing-extensions"
license=('custom')
source=("https://files.pythonhosted.org/packages/59/b6/21774b993eec6e797fbc49e53830df823b69a3cb62f94d36dfb497a0b65a/typing_extensions-3.7.4.tar.gz")
sha256sums=('2ed632b30bb54fc3941c382decfd0ee4148f5c591651c9272473fea2c6397d95')

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
