#Maintainer: M0Rf30

pkgname=soundcloud-dl-git
pkgver=v1.3.3b1.r100.g5a41cf2
pkgrel=1
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
arch=(any)
depends=(
	python-clint
	python-docopt
	python-fudge
	python-mutagen
	python-simplejson
	python-soundcloud-git
	python-termcolor
	python-requests
)
makedepends=(git python-setuptools)
source=($pkgname::git+https://github.com/flyingrub/scdl.git)
license=(GPL2)

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $srcdir/$pkgname
	python3 setup.py install --root="$pkgdir"
}

md5sums=('SKIP')
