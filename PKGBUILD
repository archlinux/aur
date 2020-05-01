# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-dbp
pkgver=1.1.9
pkgrel=6
pkgdesc="David's batch processor for the GIMP"
arch=('x86_64')
url="http://members.ozemail.com.au/~hodsond/dbp.html"
license=('GPL')
depends=('gimp')
source=(http://www.ozemail.com.au/~hodsond/dbpSrc-${pkgver//./-}.tgz)
sha512sums=('f2b05610c0edd179a394f510951147fb3362564d67cb2b48ecbd1840b97b9c3de43c718db06576a99d9a5b76384ff4b4a4cdfeddd16a015d161f338d351be925')

build() {
  cd "${srcdir}/dbp-${pkgver}"
  sed -i "s|<string>|<cstring>|" op.h
  make
}

package() {
  cd "${srcdir}/dbp-${pkgver}"
  install -D -m755 dbp "${pkgdir}/usr/lib/gimp/2.0/plug-ins/dbp"
}
