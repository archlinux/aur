# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-smac"
_name="smac"
pkgver=2.4.1
pkgrel=1
pkgdesc="A Versatile Bayesian Optimization Package for Hyperparameter Optimization"
url="https://github.com/automl/SMAC3"
license=("BSD-3")
arch=("any")
depends=("python"
         "python-numpy"
         "python-scipy"
         "python-psutil"
         "python-pynisher"
         "python-configspace"
         "python-joblib"
         "python-scikit-learn"
         "python-pyrfr"
         "python-dask"
         "python-distributed"
         "python-dask-jobqueue"
         "python-emcee"
         "python-regex"
         "python-pyaml")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('ec944370779539e50941e7694f5a47251a88db70cabbc8b4608fed82643ae4ba2a303a098ab34e59f251309f270cd4435d4bac09b3414f2e79dfddd1d6d0decd')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
