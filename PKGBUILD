# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-optuna
pkgver=3.2.0
pkgrel=1
pkgdesc="A hyperparameter optimization framework"
arch=('any')
url="https://optuna.org"
license=('MIT')
depends=("python"
    "python-alembic"
    "python-cmaes"
    "python-colorlog"
    "python-numpy"
    "python-packaging"
    "python-sqlalchemy"
    "python-tqdm"
    "python-pyyaml")
optdepends=() # Too many to list here
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/optuna/$_name/archive/v$pkgver.tar.gz")
sha256sums=('eaf63ef73cf7b92fb25320cb9546b3a4b0bab83d911a353b7e00aa940581ddcb')

build() {
    python -m pip wheel ./$_name-$pkgver --no-build-isolation
}

package() {
    python -m installer --destdir="$pkgdir" optuna-${pkgver}-*.whl
}
