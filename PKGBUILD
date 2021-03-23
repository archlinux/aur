# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-yqxx
_pkgname="${pkgname#*-}"
pkgver=0.4.1
pkgrel=1
pkgdesc="Auto submitter for xg.hit.edu.cn yqxx"
arch=('any')
url="https://github.com/billchenchina/yqxx"
license=('AGPL3')
depends=('python-beautifulsoup4' 'python-pycryptodome' 'python-requests' 'python-yaml' 'python-hitutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('3f28a961276892718c16f2fce3106409119b121736e53d3907c41c7729681f7d')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
