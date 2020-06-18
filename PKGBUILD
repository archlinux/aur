# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: bitwave <bitwave [aTT] oomlu [dOot] de>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=zpipe
pkgver=201
pkgrel=2
pkgdesc="Incremental Journaling Backup Utility and Archiver"
arch=('i686' 'x86_64')
url="http://mattmahoney.net/dc/zpaq.html"
license=('GPL')
depends=('zpaq')
source=(http://mattmahoney.net/dc/zpipe.201.zip)
sha512sums=('d126187ca868ccd0092f63bb47ac9fa7ebb6befb3f5de03857ee14b7e5e9177ba7c9b04c9e5a3b7dc3743773d0602882e00d877fa4daca9fab27922c30bda4ee')


build() {
  make -C $srcdir zpipe LDLIBS+="-lzpaq"
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/zpipe $pkgdir/usr/bin
}
