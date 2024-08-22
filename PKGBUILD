# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=adaptix
pkgname=python-dataclass-factory
pkgver=2.16
pkgrel=4
pkgdesc='An utility class for creating instances of dataclasses'
arch=('any')
url='https://github.com/reagento/dataclass-factory'
license=('Apache')
depends=('python>=3.7')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('e877b489cde8d9e5248335b4a215cd3891eb6b6103cf5f34b3b7b4161b78f4ab0eca9ae50afc0d5b0bb98618a707b571b704990668b584b527d02a11e220ab91')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
