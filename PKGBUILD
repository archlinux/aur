# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-optuna
pkgver=4.1.0
pkgrel=1
pkgdesc="A hyperparameter optimization framework"
arch=('any')
url="https://optuna.org"
license=('MIT')
depends=("python"
    "python-alembic"
    "python-colorlog"
    "python-numpy"
    "python-packaging"
    "python-sqlalchemy"
    "python-tqdm"
    "python-pyyaml")
optdepends=() # Too many to list here
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/optuna/$_name/archive/v$pkgver.tar.gz")
sha256sums=('a98b2f25f01ff2426176db2aedf30cf4aaed817f3ff0d2310b681e60453c946a')

build() {
    python -m pip wheel ./$_name-$pkgver --no-build-isolation
}

package() {
    python -m installer --destdir="$pkgdir" optuna-${pkgver}-*.whl
}
