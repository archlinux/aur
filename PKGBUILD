# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-stldict
pkgver=0.8
pkgrel=1
pkgdesc="This package provides a light-weight, no frills interface to the C++ dictionary containers map and unordered_map."
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'libstdc++5')
makedepends=()
groups=(pure-complete pure-util)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('d2666346eac3410bc2839cdd920167ebedd72e21')

build() {
     cd $srcdir/$pkgname-$pkgver
     #./configure --prefix=/usr
     #export LDFLAGS="$LDFLAGS -Wl,--no-as-needed"

     #make | tee - make.log || return 1
     make || return 1
}

package() {
     cd $srcdir/$pkgname-$pkgver
     #make DESTDIR=$pkgdir install | tee - make_install.log || return 1
     make DESTDIR=$pkgdir install || return 1
}
