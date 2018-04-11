# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pure-sockets
pkgver=0.8
pkgrel=1
pkgdesc="A Pure interface to the Berkeley socket functions."
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=()
groups=(pure-complete pure-util)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('d7f8ec729e03f377b786200da4e1653f')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
