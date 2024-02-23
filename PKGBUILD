# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>

pkgname=python-crepes
pkgver=0.6.2
pkgrel=1
pkgdesc='Python support for conformal classifiers, regressors, and predictive systems'
arch=(any)
url='https://crepes.readthedocs.io/'
_url='https://github.com/henrikbostrom/crepes'
license=(BSD)
depends=(
  python
  python-numpy
  python-pandas
  python-scikit-learn
)
makedepends=(
  python-setuptools
  python-wheel
)
_archive="${pkgname#python-}-$pkgver"
source=("${_url}/archive/v${pkgver}/${_archive}.tar.gz")
sha256sums=('c2bf25f8dbfbadc6c8b0770f2fb6d1ffadb99afab7a14ea8c62f0e0d6a001a8c')

package() {
	cd $_archive
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
