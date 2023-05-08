# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Ron B.S <ronthecookie0101 on gmail --OR-- me AT ronthecookie DOT me >

_name=pytube
pkgname=python-$_name
pkgver=15.0.0
pkgrel=1
pkgdesc="A lightweight, dependency-free Python library (and command-line utility) for downloading YouTube Videos"
arch=(any)
url="https://github.com/pytube/pytube"
license=(Unlicense)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('076052efe76f390dfa24b1194ff821d4e86c17d41cb5562f3a276a8bcbfc9d1d')

build() {
	cd pytube-$pkgver
	python setup.py build
}

package() {
	cd pytube-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
