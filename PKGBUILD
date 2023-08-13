# Maintainer:  Marco Rubin <marco.rubin@protonmail.com>
# Contributor: WhiredPlanck

_name=dataclass-factory
pkgname=python-$_name
pkgver=2.13
pkgrel=1
pkgdesc='An utility class for creating instances of dataclasses'
arch=('any')
url='https://github.com/reagento/dataclass-factory'
license=('Apache-2.0')
depends=('python>=3.7')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('ff1d79cc73a81556a45ca223137560de3e46d89a46d5e322e91652f2d30ef7187aaf2cd470bf0a79d86af37c42d57d4107406c3e7d429f076383c4d4a5d5a269')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
