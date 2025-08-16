# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>

_name=imbalanced-learn
pkgname=python-${_name,,}
pkgver=0.14.0
pkgrel=1
pkgdesc='Toolbox for imbalanced dataset in machine learning'
arch=('any')
url="https://github.com/scikit-learn-contrib/imbalanced-learn"
license=('MIT')
depends=('python>=3.10'
	 'python-numpy>=1.24.3'
	 'python-scipy>=1.10.1'
	 'python-scikit-learn>=1.3.2'
	 'python-joblib>=1.1.0'
	 'python-threadpoolctl>=2.0.0'
	 'python-sklearn-compat>=0.1'
)
optdepends=('python-keras: for dealing with Keras models'
	    'python-tensorflow: for dealing with TensorFlow models'
	    'python-pandas: for dealing with Pandas DataFrames'
	    'python-matplotlib: for included examples'
	    'python-seaborn: for included examples'
	    )
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=(8a8700c02ca185e113064815513f990fbf84eb4e7701f1d4e944ce67fb259a60)

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
