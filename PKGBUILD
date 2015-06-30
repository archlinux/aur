# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=$pkgname
pkgname=perspector
_arcdir=ambrevar-$_pkgname-39f116569de2
pkgver=1.2
pkgrel=2
pkgdesc="A control-point-based perspective rectification tool"
arch=('i686' 'x86_64')
url="http://ambrevar.bitbucket.org/$_pkgname"
license=('MIT')
depends=('gsl' 'gtk3')
source=(https://bitbucket.org/ambrevar/$_pkgname/get/v$pkgver.tar.bz2)
sha256sums=('fccc60320df2a30b44779bc0751c3be324de8cfc3583473ebb71b624306ff05a')

build() {
	cd "$srcdir/$_arcdir"
	make
}

package() {
	cd "$srcdir/$_arcdir"
	make install DESTDIR="$pkgdir" prefix="/usr"
}
