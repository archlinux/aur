#Maintainer: M0Rf30

pkgname=lorcon-old
pkgrel=4
pkgver='197'
pkgdesc="LORCON wireless packet injection library"
url="http://802.11ninja.net/lorcon/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libnl' 'libpcap')
makedepends=('subversion')
provides=("lorcon=199")
source=('svn+http://802.11ninja.net/svn/lorcon/branch/lorcon-old')
sha1sums=('SKIP')

build() {
  cd "$srcdir/lorcon-old"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/lorcon-old"

  make "DESTDIR=$pkgdir/" install
  mv "$pkgdir/usr/share/man/man3"/{lorcon.3,lorcon-old.3}
}