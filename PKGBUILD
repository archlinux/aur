# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-tpot2"
_name="TPOT2"
pkgver=0.1.9a0
pkgrel=1
pkgdesc="A Python Automated Machine Learning tool that optimizes machine learning pipelines using genetic programming"
url="https://epistasislab.github.io/tpot2/"
license=("LGPL-3.0")
arch=("any")
depends=("python"
         "python-baikal"
         "python-configspace"
         "python-dask"
         "python-dask-expr"
         "python-dask-jobqueue"
         "python-distributed"
         "python-func_timeout"
         "python-joblib"
         "python-lightgbm"
         "python-matplotlib"
         "python-networkx"
         "python-optuna"
         "python-pandas"
         "python-scikit-learn"
         "python-scipy"
         "python-stopit"
         "python-tqdm"
         "python-traitlets"
         "python-update_checker"
         "python-xgboost"
         )
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('8db6b59dc331f43f828232a49e4a949ab1e1a8d1f69a5327d7547e58d0afad5c709afb7e3e932bf4e376a1228cf5804c32956a8868c7fbfb2d7972380b98c920')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
