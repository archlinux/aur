# Maintainer: Julian Daube <joposter at gmail dot com>

pkgname=python2-pafy-git
_pkgname=python2-pafy
pkgver='v0.3.74.10.g80d5b87'
pkgrel=1
pkgdesc="Python API for YouTube"

url="http://np1.github.io/pafy"
arch=('any')
license=('GPL3')

provides=('python2-pafy')
depends=('python2')
conflicts=('python-pafy')

source=("$_pkgname::git+https://github.com/mps-youtube/pafy.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname" &&
  	git describe --long --tags | sed 's/-\+/./g' # | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
