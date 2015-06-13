# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-stllib
pkgver=0.6
pkgrel=1
pkgdesc="An 'umbrella' package that contains a pair of Pure addons, pure-stlvec and pure-stlmap. These addons provide Pure interfaces to a selection of containers provided by the C++ Standard Library, specialized to hold pointers to arbitrary Pure expressions."
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'libstdc++5')
makedepends=()
provides=('pure-stlvec')
conflicts=('pure-stlvec')
groups=(pure-complete pure-util)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('47584905c29b662178c954587970b1ef0a2f977a')

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
