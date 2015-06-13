# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-readline
pkgver=0.3
pkgrel=1
pkgdesc="A simple interface to the GNU readline and BSD editline libraries for Pure"
arch=("i686" "x86_64")
license=('custom')
url="http://purelang.bitbucket.org/"
depends=('pure' 'readline')
makedepends=()
groups=(pure-complete pure-util)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=(ddf4f591b5f8ec9ed7c87509b7c9e4570843eb6a)

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
