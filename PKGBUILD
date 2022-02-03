# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-optuna
pkgver=2.10.0
pkgrel=3
pkgdesc="A hyperparameter optimization framework"
arch=('any')
url="https://optuna.org"
license=('MIT')
depends=("python"
    "python-alembic"
    "python-cliff"
    "python-cmaes"
    "python-colorlog"
    "python-numpy"
    "python-packaging"
    "python-scipy"
    "python-sqlalchemy"
    "python-tqdm")
optdepends=() # Too many to list here
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/optuna/$_name/archive/v$pkgver.tar.gz")
md5sums=('e2eccd727e531b65408b51e8515ed04c')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
