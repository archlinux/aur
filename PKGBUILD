# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=python-lunr
_pkgname=lunr
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python implementation of Lunr.js (for mkdocs)"
arch=('any')
url="https://github.com/yeraydiazdiaz/lunr.py"
license=('MIT')
# Most of these deps are transitive deps of python-nltk
depends=('python-nltk>=3.2.5' 'python-future>=0.16.0' 'python-tqdm' 'python-joblib' 'python-regex')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('d263e494c5f701375c6e07737690e6dad99e4dbe85f57d255ccdb402fbe8ce11')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

