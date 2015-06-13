# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: bjoern lindig <bjoern dot lindig at googlemail dot com>

pkgname=pure-gen
pkgver=0.20
pkgrel=1
pkgdesc="A C interface generator for Pure"
arch=("i686" "x86_64")
license=('custom')
url="http://purelang.bitbucket.org/"
depends=('pure' 'haskell-language-c')
makedepends=('ghc')
groups=(pure-complete pure-util)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('20807ac0c4f725e3430675327c7bc5fb6fbb2982')

build() {
	cd $srcdir/$pkgname-$pkgver
	make PUREC_FLAGS=-mcpu=generic
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
