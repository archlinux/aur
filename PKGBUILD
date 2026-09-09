# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=jsrc
pkgver=0.4.0
pkgrel=1
pkgdesc="Python library for bioinformatics and scientific computing"
arch=('any')
url="https://github.com/imjiaoyuan/jsrc"
license=('MIT')
depends=('python>=3.10')
optdepends=('python-matplotlib>=3.5: plotting (jsrc plot) module')
provides=("python-jsrc=$pkgver")
conflicts=('python-jsrc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools>=61.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a221c3f8fe98822ae859cfc83c337467590597d78bf1436482159984e2d445ef')

build() {
    cd "jsrc-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "jsrc-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
