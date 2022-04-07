# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=nxviz
pkgname=python-$_name
pkgver=0.7.3
pkgrel=1
pkgdesc='Visualization Package for NetworkX'
arch=(x86_64)
url='https://github.com/ericmjl/nxviz'
license=('MIT')
depends=()
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
