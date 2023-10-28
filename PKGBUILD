# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=nxviz
pkgname=python-$_name
pkgver=0.7.4
pkgrel=2
pkgdesc='Visualization Package for NetworkX'
arch=('any')
url='https://github.com/ericmjl/nxviz'
license=('MIT')
depends=(
    'python'
    'python-matplotlib>=3.3.3'
    'python-more-itertools>=8.6.0'
    'python-networkx>=2.5'
    'python-numpy>=1.19.4'
    'python-palettable>=3.3.0'
    'python-pandas>=1.2.0'
    'python-seaborn>=0.11.1'
)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9499b8feadffe257fef580c8300c74e5dd902924901e8050f96b0ad15f18eb22')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
