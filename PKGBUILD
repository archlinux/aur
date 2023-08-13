# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=dataclass-factory
pkgname=python-$_name
pkgver=2.16
pkgrel=2
pkgdesc='An utility class for creating instances of dataclasses'
arch=('any')
url='https://github.com/reagento/dataclass-factory'
license=('Apache')
depends=('python>=3.7')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('1fccd1440ac1c2c387fe17e04dd922ce6c0c107ecc4d46d9363e88998c6c4803e04a5d76867e1c630a269b0890a0fc0e4825f95b533ee4f802129b847ec502ad')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
