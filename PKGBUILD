# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Tatsunori Aoki <ginjiro.135 [at] gmail.com>

pkgname="athena-jot"
pkgver="9.0"
pkgrel="5"
epoch="1"
pkgdesc="Print sequential or random data"
arch=("x86_64")
url="http://www.mit.edu/afs/athena/system/rhlinux/athena-9.0/free/SRPMS/athena-jot-9.0-3.src.rpm"
license=("BSD")
depends=("glibc")
makedepends=("gcc")
source=("http://www.mit.edu/afs/athena/system/rhlinux/athena-9.0/free/SRPMS/athena-jot-9.0-3.src.rpm")
sha1sums=("ffb286569ea48159d760c3de0fd3749db92348c8")

build() {
  cd "${srcdir}"
  tar xvf "${pkgname}-${pkgver}.tar.gz"
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
