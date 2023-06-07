# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-sexpdata
_name=sexpdata
pkgver=1.0.1
pkgrel=1
pkgdesc="S-expression parser for Python"
arch=('any')
url="https://github.com/tkf/sexpdata"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://pypi.python.org/packages/source/s/sexpdata/sexpdata-${pkgver}.tar.gz")
sha256sums=('6f65f115291890cbce5cd269c13bdf1f82a4cd23bc61b6e150a27511ee6a7d5e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
