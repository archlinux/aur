#Maintainer: M0Rf30

pkgname=soundcloud-dl-git
pkgver=r121.c3d87d2
pkgrel=1
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
arch=(any)
depends=(
python-clint
python-docopt
python-eyed3
python-fudge
python-mutagen
python-simplejson
python-six
python-soundcloud-git
python-termcolor
python-urllib3
python-wget
python-wget
recode
)
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
