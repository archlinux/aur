# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=python-httpie-oauth
pkgdesc="OAuth plugin for httpie"
license=('BSD')
url="https://github.com/jkbrzt/httpie-oauth"
pkgver=5.6cf6ed4
pkgrel=2

source=("$pkgname::git+$url.git")
md5sums=('SKIP')
depends=('python-oauthlib' 'python-requests-oauthlib')
makedepends=('python-distribute' 'git')
arch=('any')

pkgver() {
	cd "$srcdir/$pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$pkgname"
	python3 setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python3 setup.py install --root="$pkgdir" --optimize=1
}
