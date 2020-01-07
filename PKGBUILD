# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-nodeenv
_name=${pkgname#python-}
pkgver=1.3.4
pkgrel=1
pkgdesc="Node.js virtual environment builder"
url="https://ekalinin.github.io/nodeenv/"
license=("BSD")
arch=('any')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/ekalinin/$_name/archive/$pkgver.tar.gz")
sha256sums=('5942ac26188ae682a031a9de31ca38fe8323326f4a5cf2149ac7253072543834')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
