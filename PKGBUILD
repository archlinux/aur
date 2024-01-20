# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Boyang Yan <yanboyang713@gmail.com>

pkgname=python-sexpdata
_name=sexpdata
pkgver=1.0.2
pkgrel=1
pkgdesc="S-expression parser for Python"
arch=('any')
url="https://github.com/tkf/sexpdata"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://pypi.python.org/packages/source/s/sexpdata/sexpdata-${pkgver}.tar.gz")
sha256sums=('92b67b0361f6766f8f9e44b9519cf3fbcfafa755db85bbf893c3e1cf4ddac109')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
