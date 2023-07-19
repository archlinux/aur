# Maintainer: Thomas Bork <sudoBash418@gmail.com>

pkgname=python-zodb
_pkgname=ZODB
pkgver=5.8.1
pkgrel=1
pkgdesc="A native object database for Python"
arch=(any)
url="http://www.zodb.org/en/latest/index.html"
license=('ZPL')
depends=(
	'python'
	'python-btrees'
	'python-persistent'
	'python-transaction'
	'python-zc.lockfile'
	'python-zcatalog'
	'python-zodbpickle'
)
optdepends=('python-btreefolder2')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c6c73abd3660d606ffc1f21f97def14b52b46f4a702ec9e6ee449a6e2be264df')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize 1 --skip-build
}
