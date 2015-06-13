# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-midi
pkgver=0.6
pkgrel=1
pkgdesc="MIDI interface for pure."
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'portmidi')
makedepends=()
groups=(pure-complete pure-multimedia)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('6cf29d69499d3fc5056294b92b9f8d24')

build() {
     cd $srcdir/$pkgname-$pkgver
     #./configure --prefix=/usr

     make || return 1
}

package() {
     cd $srcdir/$pkgname-$pkgver
     make DESTDIR=$pkgdir install || return 1
}
