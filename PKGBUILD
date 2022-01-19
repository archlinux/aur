# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
pkgver=0.6.9
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL3')
depends=('python-requests')
makedepends=('python-setuptools' 'git')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('E09E6FC5E0472F735B7599C4BBEDD0C513635C9F')

build() {
	cd "$pkgname"
	python setup.py build
}

## tests require an active Tidal session

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
