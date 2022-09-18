# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-optuna
pkgver=3.0.2
pkgrel=1
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
md5sums=('062f4fd7b20273ecd06e7653b2d8a279')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
