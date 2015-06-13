# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pure-avahi
pkgver=0.3
pkgrel=1
pkgdesc="An Avahi/Zeroconf interface for Pure"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'avahi')
makedepends=()
groups=(pure-complete pure-util)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('7f8d1b5420af698c2e6cd9f393268e8becc1ae3d')

build() {
     cd $srcdir/$pkgname-$pkgver
     make || return 1
}

package() {
     cd $srcdir/$pkgname-$pkgver
     make DESTDIR=$pkgdir install || return 1
     cp zeroconf.pure $pkgdir/usr/lib/pure
}
