# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-smac"
_name="smac"
pkgver=2.1.0
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
b2sums=('8a7f57f7c9157edb239fbfaac4d685525d109511d13a4ee66962a9e0fc59057418683991a82e634501755fb02941ab9a6917d05f7ebf04a68460caf7b55463a6')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
