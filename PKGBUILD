# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pure-xml
pkgver=0.7
pkgrel=1
pkgdesc="A simplified interface to the Gnome libxml2 and libxslt libraries for Pure"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'libxml2' 'libxslt')
makedepends=()
groups=(pure-complete pure-web)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('245f8c39c2c09da1730f2bb3926d1870')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
