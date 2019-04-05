# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pytest-pudb
pkgver=0.7.0
pkgrel=1
pkgdesc="Pytest plugin for PuDB debugger integration"
url="https://github.com/wronglink/pytest-pudb"
arch=('any')
license=('MIT')
depends=('python-pytest>=2.0' 'python-pudb')
source=(
  "https://files.pythonhosted.org/packages/source/p/pytest-pudb/pytest-pudb-$pkgver.tar.gz"
)
sha256sums=(
  '0ea87316d39c82163d340c28a168e08a163b8d3f484e60a53c9fd5eefe432c63'
)

build() {
    cd "pytest-pudb-$pkgver"
    python setup.py build
}

package() {
    cd "pytest-pudb-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
