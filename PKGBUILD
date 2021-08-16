# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-yqxx
_pkgname="${pkgname#*-}"
pkgver=0.5.0
pkgrel=1
pkgdesc="Auto submitter for xg.hit.edu.cn yqxx"
arch=('any')
url="https://github.com/billchenchina/yqxx"
license=('AGPL3')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-yaml' 'python-hitutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5f1ee26bfb3816b8e572017e0ad414ce09c1d0db4f1f35c55f611af4284e1710')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
