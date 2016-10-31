# Maintainer: Felix Salfelder <felix aet salfelder dot org>

_pkgname=gnucap-adms
pkgname=$_pkgname-git
pkgver=r578.e719276
pkgrel=1
pkgdesc="automatic device model compiler for Gnucap"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap-git' 'boost' 'adms-git' 'gnucap-make-git')
makedepends=('git')
provides=('gnucap-adms')
conflicts=('gnucap-adms')
source=("$_pkgname::git+git://git.sv.gnu.org/gnucap/gnucap-adms.git#branch=unstable")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd $_pkgname
	make check || :
	echo THIS IS WORK IN PROGRESS
	echo THIS IS WORK IN PROGRESS
	echo CURRENTLY, ONLY A FEW TESTS PASS
	echo THIS IS WORK IN PROGRESS
	echo THIS IS WORK IN PROGRESS
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" install
}
