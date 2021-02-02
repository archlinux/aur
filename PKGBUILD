# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-dbp
pkgver=1.1.9
pkgrel=6
pkgdesc="David's batch processor for the GIMP"
arch=('x86_64')
url="http://gimpdbpplugin.sourceforge.net"
license=('GPL')
depends=('gimp')
source=("https://downloads.sourceforge.net/project/gimpdbpplugin/Source-Code/dbpSrc-1-1-9.tgz")
sha256sums=('6f69ce1a8723007ea678644370b7f308417349415687ad04d9a68b24fceaceab')

build() {
  cd "${srcdir}/dbp-${pkgver}"
  sed -i "s|<string>|<cstring>|" op.h
  make
}

package() {
  cd "${srcdir}/dbp-${pkgver}"
  install -D -m755 dbp "${pkgdir}/usr/lib/gimp/2.0/plug-ins/dbp"
}
