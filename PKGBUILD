# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gimp-dbp
pkgver=1.1.9
pkgrel=6
pkgdesc="David's batch processor for the GIMP"
arch=('x86_64')
url="https://sourceforge.net/projects/gimpdbpplugin/"
license=('GPL')
depends=('gimp')
source=("https://sourceforge.net/projects/gimpdbpplugin/files/Source-Code/dbpSrc-1-1-9.tgz/download")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/dbp-${pkgver}"
  sed -i "s|<string>|<cstring>|" op.h
  make
}

package() {
  cd "${srcdir}/dbp-${pkgver}"
  install -D -m755 dbp "${pkgdir}/usr/lib/gimp/2.0/plug-ins/dbp"
}
