# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-yqxx
_pkgname="${pkgname#*-}"
pkgver=0.5.3
pkgrel=1
pkgdesc="Auto submitter for xg.hit.edu.cn yqxx"
arch=('any')
url="https://github.com/billchenchina/yqxx"
license=('AGPL3')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-yaml' 'python-hitutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ef7b2916ec9bb7dd16a14f2faa6386a26f5b66c40dd31bf5e174c8b29ba8d89d')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
