# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-auto-sklearn"
_name="${pkgname/python-/}"
pkgver=0.15.0
pkgrel=1
pkgdesc="An automated machine learning toolkit and a drop-in replacement for a scikit-learn estimator"
url="https://github.com/automl/auto-sklearn"
license=("BSD-3")
arch=("any")
depends=("python"
         "python-typing_extensions"
         "python-distro"
         "python-numpy"
         "python-scipy"
         "python-joblib"
         "python-scikit-learn"
         "python-dask"
         "python-distributed"
         "python-pyyaml"
         "python-pandas"
         "python-liac-arff"
         "python-threadpoolctl"
         "python-tqdm"
         "python-configspace"
         "python-pynisher"
         "python-pyrfr"
         "python-smac")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('0e2ee0c34af023af515f7e5bc9102d563fd002edd10146a3dce4db3e10ba1a4f5aff7365b3e2db33b44a2fb67e13302287346efe99cc606689ea421b1857864a')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
