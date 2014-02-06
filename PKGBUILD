# Maintainer: Johannes Löthberg <johannes2kyriasis.com>

pkgname=python-pafy-git
pkgver=git
pkgrel=1
pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
arch=('any')
url="http://np1.github.io/pafy"
license=('GPL3')
depends=('python')
source=('git+https://github.com/np1/pafy.git')
md5sums=('SKIP')

pkgver() {
	cd pafy
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd pafy
	python setup.py install --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sts=2 sw=2 noet:
