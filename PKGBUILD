# Maintainer: Tatsunori Aoki <ginjiro.135 [at] gmail.com>

pkgname='athena-jot'
pkgver='9.0'
pkgrel='2'
pkgdesc='print sequential or random data.'
url='http://www.mit.edu/afs/athena/system/rhlinux/athena-9.0/free/SRPMS/athena-jot-9.0-3.src.rpm'
arch=('x86_64' 'i686')
license=('BSD')
makedepends=('gcc')
source=('http://www.mit.edu/afs/athena/system/rhlinux/athena-9.0/free/SRPMS/athena-jot-9.0-3.src.rpm')
sha1sums=('ffb286569ea48159d760c3de0fd3749db92348c8')

build() {
  cd ${srcdir}
  tar xvf athena-jot-9.0.tar.gz
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure
  make
}

package() {
  install -d ${pkgdir}/usr/local/bin
  install -d ${pkgdir}/usr/local/man/man1
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
