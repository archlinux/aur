# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-yqxx
_pkgname="${pkgname#*-}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Auto submitter for xg.hit.edu.cn yqxx"
arch=('any')
url="https://github.com/billchenchina/yqxx"
license=('AGPL3')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-yaml' 'python-hitutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('fe19e7a0f2dd92923460c6bb7abe8c1304a158bc8bb3a2f0373801b4da2dc209')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
