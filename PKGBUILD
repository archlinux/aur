# Maintainer: alastair pharo  asppsa at gmail dot com
# Maintainer: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-mpfr
pkgver=0.5
pkgrel=1
pkgdesc="An interface to the GNU mpfr library for performing multiprecision floating point arithmetic with proper rounding."
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=()
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('0fb879739b5cdcaea6007a3c64a10f61')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
