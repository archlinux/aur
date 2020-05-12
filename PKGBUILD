# Maintainer: Josh Holbrook <josh.holbrook@gmail.com>

pkgname=python-pyee
pkgver=7.0.2
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python."
arch=('any')
url="https://github.com/jfhbrook/pyee"
license=('MIT')
depends=('python' 'python-wheel' 'python-pip')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
sha256sums=('c908d1ecb32918bbf7dbb895a093153b0ca1ed8f04fc067d98bd4c5917aeb3d8')

build() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
