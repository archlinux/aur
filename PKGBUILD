# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-gtk
pkgver=0.13
pkgrel=1
pkgdesc="A collection of bindings to use the GTK+ 2.x with Pure"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'gtk2' 'pure-ffi')
makedepends=('pure-gen')
groups=(pure-complete pure-graphics)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('8792a79539c52a4e55e9787aa99da379b5544eab')

build() {
	cd $srcdir/$pkgname-$pkgver
	make generate
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install 
}
