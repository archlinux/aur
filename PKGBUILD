# Maintainer: Josh Holbrook <josh.holbrook@gmail.com>

pkgname=python-pyee
pkgver=6.0.0
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python."
arch=('any')
url="https://github.com/jfhbrook/pyee"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
sha256sums=('a9c9b60e8693a260dd942ef5a71358cfcbba15792d5e72caf0e3c891c4e91c3b')

build() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
