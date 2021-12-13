# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

pkgname=python-pytube
pkgver=11.0.1
pkgrel=2
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos"
arch=('any')
url="https://github.com/pytube/pytube"
license=('Unlicense')
depends=('python')
makedepends=('python-setuptools')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('47643a6ff553cbc4d6be748ff14c9c45f79984e15005adff25d62b18110abe43')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
