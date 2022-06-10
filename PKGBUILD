# Contributor: Emanuel Couto <unit73e at gmail dot com>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-sexpdata
_name=sexpdata
pkgver=0.0.3
pkgrel=4
pkgdesc="S-expression parser for Python"
arch=('any')
url="https://github.com/tkf/sexpdata"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://pypi.python.org/packages/source/s/sexpdata/sexpdata-${pkgver}.tar.gz")
sha256sums=('1ac827a616c5e87ebb60fd6686fb86f8a166938c645f4089d92de3ffbdd494e0')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
