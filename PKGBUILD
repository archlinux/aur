# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-hitutil
_pkgname="${pkgname#*-}"
pkgver=0.1.1
pkgrel=1
pkgdesc="hit.edu.cn utils"
arch=('any')
url="https://github.com/billchenchina/hitutil"
license=('AGPL3')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e595b99740903097e3f73dddf0167dc09eda38c524a02e04235ce81898950dab')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
