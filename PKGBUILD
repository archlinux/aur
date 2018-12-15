# Maintainer: mrsyellow <mrsyellow at protonmail dot com>
pkgname=makedepf90
pkgver=2.8.9
pkgrel=1
pkgdesc="Fortran dependency generation tool"
arch=('i686' 'x86_64')
url="https://github.com/amckinstry/makedepf90"
license=('GPL2')
makedepends=('git')
provides=("makedepf90")
source=(git+https://github.com/amckinstry/makedepf90.git#branch=upstream)
md5sums=('SKIP')				# skip b.c. loading current git sources

pkgver() {
	cd "$srcdir/makedepf90"
	git describe --tags | sed 's/^upstream\///'
}

build() {
	cd "$srcdir/makedepf90"
  ./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/makedepf90"
	make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install
}
