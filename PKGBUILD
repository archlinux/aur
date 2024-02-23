# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>

pkgname=python-venn-abers
pkgver=1.4.1
pkgrel=1
pkgdesc='Venn-ABERS calibration for binary and multiclass classification problems'
arch=(any)
url='https://pypi.org/project/venn-abers/'
license=(MIT)
depends=(
  python
  python-numpy
  python-pandas
  python-scikit-learn
  python-catboost
)
makedepends=(
  python-setuptools
  python-wheel
)
_url='https://files.pythonhosted.org/packages'
_url_hash='51/18/e048732debc82755ce6349a3c4a212092008530a665f454984c51613862c'
_archive="${pkgname#python-}-$pkgver"
source=("${_url}/${_url_hash}/${_archive}.tar.gz")
sha256sums=('f091c994948dace6e800dc4e072c3e2b74f3e015c644702fbdabc597bebc3788')

package() {
	cd $_archive
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.TXT
}
