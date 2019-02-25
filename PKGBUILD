# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="python-spam-blocklists"
_pkgname="spam-blocklists"
pkgver=0.9.3
pkgrel=1
pkgdesc='Provides programatic access to spam blocklists'
arch=("any")
url='https://pypi.python.org/pypi/spam-blocklists/0.9.3'
license=("LGPL")
depends=("python")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('11be18d1ebafcb38ee136e1891cca08dc8f822a577a191c7759081c303abfcf8')

build() {
	cd "$_pkgname-$pkgver"
	python ./setup.py build
}

# upstream test suite is py2-only
#check() {
#	cd "$_pkgname-$pkgver"
#	python ./setup.py test
#}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
