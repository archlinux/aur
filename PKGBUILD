# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-liblo
pkgver=0.9
pkgrel=1
pkgdesc="Complete Pure bindings of liblo"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'liblo')
makedepends=()
groups=(pure-complete pure-multimedia)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('ec47202a5c83014be0312184e21f352e')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}

