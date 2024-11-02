# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-tpot2"
_name="TPOT2"
pkgver=0.1.7a0
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
b2sums=('860c779c8c439a607f82e46d99cf1552f486c071c6a0c3f62e0c2e8149440873bdebbb1eb3804af537eb03d812822c39b3cf236b65e7dce00d19218eef212dcf')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
