# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-nodeenv
_name=${pkgname#python-}
pkgver=1.3.5
pkgrel=1
pkgdesc="Node.js virtual environment builder"
url="https://ekalinin.github.io/nodeenv/"
license=("BSD")
arch=('any')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/ekalinin/$_name/archive/$pkgver.tar.gz")
sha256sums=('825944b102e44f6a7a10e3f32a2004cbb62755becbe8ed188494e5d962bc7ea3')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
