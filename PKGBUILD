# Maintainer: Josh Holbrook <josh.holbrook@gmail.com>

pkgname=python-pyee
pkgver=8.1.0
pkgrel=1
pkgdesc="A port of node.js's EventEmitter to python."
arch=('any')
url="https://github.com/jfhbrook/pyee"
license=('MIT')
depends=('python' 'python-wheel' 'python-pip')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
sha256sums=('92dacc5bd2bdb8f95aa8dd2585d47ca1c4840e2adb95ccf90034d64f725bfd31')

build() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pyee-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
