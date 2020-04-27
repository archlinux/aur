# Maintainer: Josh Holbrook <josh.holbrook@gmail.com>

pkgname=python-pyee
pkgver=7.0.1
pkgrel=2
pkgdesc="A port of node.js's EventEmitter to python."
arch=('any')
url="https://github.com/jfhbrook/pyee"
license=('MIT')
depends=('python' 'python-wheel' 'python-pip')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
sha256sums=('b0e5b89b17c8bd52a3c6517a545187907a8c69ce90169d29ebd8d2d5d7e4bc7d')

build() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
