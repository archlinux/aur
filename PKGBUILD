# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-yqxx
_pkgname="${pkgname#*-}"
pkgver=0.5.1
pkgrel=1
pkgdesc="Auto submitter for xg.hit.edu.cn yqxx"
arch=('any')
url="https://github.com/billchenchina/yqxx"
license=('AGPL3')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-yaml' 'python-hitutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6490a737f380e03444f67c228cc107586ab32e80b9ca46ee52fe9fd32ddebf77')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
