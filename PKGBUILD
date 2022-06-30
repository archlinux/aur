# Maintainer: Douglas Creager <dcreager at dcreager dot net>

pkgname=python-somecomfort
_name=somecomfort
pkgver=0.8.0
pkgrel=1
pkgdesc="A python client and utility for interacting with Honeywell thermostats"
url="https://github.com/kk7ds/somecomfort"
arch=('any')
license=('GPL-3.0')
depends=('python-requests' 'python-prettytable')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('56e60e4e9f76c12c0c9dd1016e9f1334be6800409e0762f5f143f9069d7292d3')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}

