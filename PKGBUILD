# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pure-tk
pkgver=0.5
pkgrel=1
pkgdesc="This is a much improved port of the Q Tk module which lets you develop GUI applications with Tcl/Tk. The module embeds a Tcl/Tk interpreter in your Pure programs." 
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'tk')
makedepends=()
groups=(pure-complete pure-graphics)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('03128c5a37238596ab740cdb0b4484fabfb8e493')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
