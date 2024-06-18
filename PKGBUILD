# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-tpot2"
_name="TPOT2"
pkgver=0.1.6a1
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
b2sums=('347172746b9b730082034cbeada36ba8ede8ad8d3748caabcb35a545e47c23bfe00f876b7e62b32b5f81e584a610262d569e37df248d86919f390aab1ff96d60')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
