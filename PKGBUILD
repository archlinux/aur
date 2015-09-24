# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

pkgname=perspector
_arcdir=ambrevar-$pkgname-39f116569de2
pkgver=1.2
pkgrel=3
pkgdesc="A control-point-based perspective rectification tool"
arch=('i686' 'x86_64')
url="http://ambrevar.bitbucket.org/$pkgname"
license=('MIT')
depends=('gsl' 'gtk3')
source=(https://bitbucket.org/ambrevar/$pkgname/get/v$pkgver.tar.bz2)
sha256sums=('fccc60320df2a30b44779bc0751c3be324de8cfc3583473ebb71b624306ff05a')

build() {
	cd "$srcdir/$_arcdir"
	make
}

package() {
	cd "$srcdir/$_arcdir"
	make install DESTDIR="$pkgdir" prefix="/usr"
}
