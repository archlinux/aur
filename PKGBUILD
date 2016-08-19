# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Cameron Spry <spryct@rose-hulman.edu>
pkgname=wmbutton
pkgver=0.7.0
pkgrel=2
pkgdesc="A dockapp displaying configurable buttons"
url="http://www.dockapps.net/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libxpm')
makedepends=('libx11' 'ctags')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('21421b159340e022a623560a0fb0266f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/etc"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  mv sample.wmbutton "${pkgdir}/etc/wmbutton.conf"
  mv wmbutton.1 "${pkgdir}/usr/share/man/man1"
  mv wmbutton "${pkgdir}/usr/bin/"
}
