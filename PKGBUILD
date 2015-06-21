# Author & maintainer: Bohdan Turkynewych <tb0hdan@gmail.com>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>

pkgname=sqtop-git
_distname=sqtop
pkgver=40.gdc33d36
pkgrel=1
pkgdesc="sqtop is a console applicaton to display information about currently active client connections for a Squid proxy in a convenient way."
arch=(i686 x86_64)
url="http://code.google.com/p/sqtop/"
depends=('squid')
makedepends=('squid')
provides=('sqtop')
conflicts=('sqtop')

license=('GPL')
source=(git+https://code.google.com/p/sqtop/)
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/sqtop
  echo $(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
   cd ${srcdir}/sqtop
      ./configure --prefix=/usr --sysconfdir=/etc/ 
   make
}

package() {
  cd ${srcdir}/sqtop
  make DESTDIR=${pkgdir} install
}
