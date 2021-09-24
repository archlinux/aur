# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
pkgver=0.6.8
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL3')
depends=('python-requests')
makedepends=('python-setuptools' 'git')
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('E09E6FC5E0472F735B7599C4BBEDD0C513635C9F')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
