# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=python-lunr
_pkgname=lunr
pkgver=0.6.0
pkgrel=1
pkgdesc="A Python implementation of Lunr.js (for mkdocs)"
arch=('any')
url="https://github.com/yeraydiazdiaz/lunr.py"
license=('MIT')
# Most of these deps are transitive deps of python-nltk
depends=('python-nltk>=3.2.5' 'python-future>=0.16.0' 'python-tqdm' 'python-joblib' 'python-regex')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('2c6311d1df06e0990ad7cb5fed55470a90432cf90fe636fff5b63aeea99aca80')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

