# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit com>

_gitname=httpie-oauth
pkgname=python-httpie-oauth
pkgver=5.6cf6ed4
pkgrel=2
pkgdesc="OAuth plugin for httpie"
url="https://github.com/jakubroztocil/httpie-oauth"
source=(git://github.com/jakubroztocil/httpie-oauth.git)
depends=(python-oauthlib python-requests-oauthlib)
makedepends=(python-distribute git)
md5sums=('SKIP')
license=('BSD')
arch=('any')

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${_gitname}"
	python3 setup.py build
}

package() {
	cd "${srcdir}/${_gitname}"
	python3 setup.py install --root="$pkgdir" --optimize=1
}
