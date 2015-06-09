# Maintainer: bitwave <bitwave [aTT] oomlu [dOot] de>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=zpipe
pkgver=201
pkgrel=1
pkgdesc="(De)compress from standard input to standard output using libzpaq"
arch=('i686' 'x86_64')
url="http://mattmahoney.net/dc/zpaq.html"
license=('GPL3')
depends=('zpaq')
source=(http://mattmahoney.net/dc/zpipe.201.zip)
sha256sums=(e95dfe6f701dd463f969fe16c933ed97fca194bd7aacec37d6c35409766133a8)

build() {
  make -C $srcdir zpipe CXXFLAGS+=-DNDEBUG LDLIBS+="-lzpaq"
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 755 $srcdir/zpipe $pkgdir/usr/bin
}