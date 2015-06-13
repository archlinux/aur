# Maintainer: Alastair Pharo <asppsa at gmail dot com>

pkgname=pure-glpk
pkgver=0.5
pkgrel=1
pkgdesc="A feature complete GLPK interface for the Pure programming language."
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'glpk')
makedepends=()
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('cf7146328d8ebbaefedc92ea8fe8b3eb84083ab4')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
