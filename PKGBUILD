# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodb
_pkgname=ZODB
pkgver=5.5.1
pkgrel=1
pkgdesc="A native object database for Python"
arch=(any)
url="http://www.zodb.org/en/latest/index.html"
license=('ZPL')
depends=('python' 'python-persistent' 'python-zodbpickle' 'python-transaction' 'python-zcatalog')
optdepends=('python-btreefolder2')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/zopefoundation/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('39db86d515c20d192567effc83c23092087576f119a8f24e7045fbbc714022bd')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
