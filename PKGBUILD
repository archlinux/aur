# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>

_name=imbalanced-learn
pkgname=python-${_name,,}
pkgver=0.12.0
pkgrel=1
pkgdesc='Toolbox for imbalanced dataset in machine learning'
arch=('any')
url="https://github.com/scikit-learn-contrib/imbalanced-learn"
license=('MIT')
depends=('python>=3.8' 'python-numpy>=1.17.3' 'python-scipy>=1.5.0' 'python-scikit-learn>=1.0.2')
optdepends=('python-keras: for dealing with Keras models'
	    'python-tensorflow: for dealing with TensorFlow models'
	    'python-pandas: for dealing with Pandas DataFrames'
	    'python-matplotlib: for included examples'
	    'python-seaborn: for included examples'
	    )
makedepends=('python-installer' 'python-wheel')
_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('02ef5bc9ef046f44aa20353a904366a948f7944155e77b6f09b500a70981fd13')

noextract=("$_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
}
