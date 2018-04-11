# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pure-avahi
pkgver=0.4
pkgrel=1
pkgdesc="An Avahi/Zeroconf interface for Pure"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'avahi')
makedepends=()
groups=(pure-complete pure-util)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('600ea38328664db548f0bbe2da0ffcec97cee19c')

build() {
     cd $srcdir/$pkgname-$pkgver
     make || return 1
}

package() {
     cd $srcdir/$pkgname-$pkgver
     make DESTDIR=$pkgdir install || return 1
     cp zeroconf.pure $pkgdir/usr/lib/pure
}
