# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-sexpdata
_name=sexpdata
pkgver=0.0.4
pkgrel=1
pkgdesc="S-expression parser for Python"
arch=('any')
url="https://github.com/tkf/sexpdata"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://pypi.python.org/packages/source/s/sexpdata/sexpdata-${pkgver}.tar.gz")
sha256sums=('e576f62ead32d5041e630f9457d2c1a7544d7fe5dd96a49b55159239115c3773')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
