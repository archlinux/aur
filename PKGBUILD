#Maintainer: M0Rf30

pkgname=soundcloud-dl-git
pkgver=r91.31562a3
pkgrel=1
pkgdesc="Souncloud music downloader"
url=(https://github.com/flyingrub/scdl)
arch=(any)
depends=(python-wget recode python-soundcloud-git python-docopt python-simplejson python-fudge python-urllib3 python-eyed3 python-mutagen )
makedepends=(git python-setuptools)
source=($pkgname::git+https://github.com/flyingrub/scdl.git)
install=soundcloud-dl.install
license=(GPL2)

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/$pkgname
	python3 setup.py install --root="$pkgdir"
}


md5sums=('SKIP')
