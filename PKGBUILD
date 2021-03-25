# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-hitutil
_pkgname="${pkgname#*-}"
pkgver=0.3.0
pkgrel=1
pkgdesc="hit.edu.cn utils"
arch=('any')
url="https://github.com/billchenchina/hitutil"
license=('AGPL3')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7bbeb1530dee0a0054e4049965ddfc4580f74194aa4af8c9ca00e5de4fd548a4')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
