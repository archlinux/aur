# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-gl
pkgver=0.9
pkgrel=1
pkgdesc="Pure's interface to OpenGL"
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'freeglut')
makedepends=()
groups=(pure-complete pure-graphics)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('c110eaa39126507fdd73bc678e8730cb')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}

