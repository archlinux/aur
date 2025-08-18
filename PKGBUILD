# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Chris Singley <csingley@gmail.com>

_name=ofxtools
pkgname="python-$_name"
pkgver=0.9.5
pkgrel=1
pkgdesc='A Python library for working with Open Financial Exchange (OFX) data'
arch=('any')
url="https://github.com/csingley/ofxtools"
license=('GPL-3.0-or-later')
depends=('python')
optdepends=()
makedepends=('python-setuptools')
checkdepends=()
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://pypi.io/packages/source/o/$_name/$_name-$pkgver.tar.gz")
sha256sums=('682a516bfa5ccad0f9551c17cc2cf155422f9f5f85a341cfb4911b324de46045')

build() {
	cd "$srcdir/${_name}-${pkgver}/"
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-${pkgver}/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
