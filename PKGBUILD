# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>

pkgname=python-crepes
pkgver=0.9.0
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
sha256sums=('d86f167ce8da567019cd773f7fb474622655212d49cf4d83b136b0cd86352ced')

package() {
	cd $_archive
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
