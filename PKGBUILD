# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy-git
_pkgname=python2-pafy
pkgver=v0.3.82r1.g061d9b5
pkgrel=1
pkgdesc="Python API for YouTube"
url='http://np1.github.io/pafy'
arch=('any')
license=('GPL3')
provides=('python2-pafy')
depends=('python2')
conflicts=('python-pafy')

source=("$_pkgname::git+https://github.com/mps-youtube/pafy.git#branch=0.3.x")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname" &&
  	git describe --long --tags | sed 's/\(-\+\)/r/;s/-/./g'
}

package() {
	cd "$_pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
