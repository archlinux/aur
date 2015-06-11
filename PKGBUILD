# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: John Patton <johnpatton66 at gmail.com>

pkgname=wmsmpmon
pkgver=3.1
pkgrel=2
pkgdesc="A WindowMaker dockapp that graphs usage for multiple CPU's as well as memory and swap usage."
arch=('i686' 'x86_64')
url="http://www.ribbrock.org/binabit/wmSMPmon/index.en.htm"
depends=('libxpm')
license=('GPL')
source=("http://lancre.ribbrock.org/uploads/TRi/wmSMPmon/wmSMPmon-3.1.tar.gz")
md5sums=('37e379428c1f42d47b941647627cfabb')

build() {
  cd "${srcdir}/wmSMPmon-$pkgver/wmSMPmon"
  make
}

package() {
  cd "${srcdir}/wmSMPmon-$pkgver/wmSMPmon"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man/man1"
  make BINDIR="${pkgdir}/usr/bin" MANDIR="${pkgdir}/usr/share/man" INSTALL=/bin/install install
}
