# Maintainer: Felix Salfelder

_pkgname=gnucap-make
pkgname=$_pkgname-git
pkgver=r7.dcb5d84
pkgrel=1
pkgdesc="Just in time compilation + loader for Gnucap"
arch=('i686' 'x86_64')
url="http://gnucap.org/"
license=('GPL')
depends=('gnucap-git')
makedepends=('git')
provides=('gnucap-make')
conflicts=('gnucap-make')
source=("$_pkgname::git+git://github.com/gnucap/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	make
}

check() {
	cd $_pkgname
	make check
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" install
}
