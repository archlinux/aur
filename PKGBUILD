# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy-git
_pkgname=python2-pafy
pkgver=v0.5.4r20.ga23a227
pkgrel=1
pkgdesc="Python API for YouTube"
url='https://pypi.org/project/pafy/'
arch=('any')
license=('GPL3')
provides=('python2-pafy')

makedepends=('git')
depends=('python2' 'python2-youtube-dl')
conflicts=('')

source=("$_pkgname::git+https://github.com/mps-youtube/pafy.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname" &&
  	git describe --long --tags | sed 's/\(-\+\)/r/;s/-/./g'
}

package() {
	cd "$_pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
	rm -r "$pkgdir/usr/bin"
}
