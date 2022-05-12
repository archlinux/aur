# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=12.1.0
pkgrel=1
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos"
arch=('any')
url="https://github.com/pytube/pytube"
license=('Unlicense')
depends=('python')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6de1f3a4cb125dd6ff912598c7e88a866325a63cc91755cae616f53c40ae5503')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
