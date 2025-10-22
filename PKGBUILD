# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
_name=pulp
pkgname=python-$_name
pkgver=3.3.0
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("MIT")
url="https://github.com/coin-or/pulp"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('be723ce86afd0eb4c830080f83aa4e924f6a50d6f755877626a01daa9fff1c26')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
