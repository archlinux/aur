# Based on the PKGBUILD for libmcrypt
# Contributor: Brian Petersen <me@brianrpetersen.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mcrypt
pkgver=2.6.8
pkgrel=1
pkgdesc="A replacement for the old unix crypt(1)."
url="http://mcrypt.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmcrypt' 'mhash' 'zlib')
options=('!libtool' '!emptydirs')
source=("http://downloads.sourceforge.net/mcrypt/${pkgname}-${pkgver}.tar.gz")
md5sums=('97639f8821b10f80943fa17da302607e')
sha1sums=('8ae0e866714fbbb96a0a6fa9f099089dc93f1d86')
sha256sums=('5145aa844e54cca89ddab6fb7dd9e5952811d8d787c4f4bf27eb261e6c182098')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

