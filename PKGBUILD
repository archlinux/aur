# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
_name=pulp
pkgname=python-$_name
pkgver=3.1.1
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("MIT")
url="https://github.com/coin-or/pulp"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('4dfe2da736da1036f60bf2219b43952eb522a0f4c54e4b939b2f0087d13feeb9')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
