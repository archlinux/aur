# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=libggiwmh
pkgver=0.3.2
pkgrel=1
pkgdesc="A libggi extension whereby wmh stands for 'Window Manager Hints'"
arch=('i686' 'x86_64')
url="http://ibiblio.org/ggicore/packages/${pkgname}.html"
license=('custom')
depends=('libggi')
source=("http://downloads.sourceforge.net/project/ggi/misc/${pkgname}-${pkgver}/${pkgname}-${pkgver}.src.tar.gz")
md5sums=('833ca6eb19b83c3c35d07ea3cf44e12b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/usr/share/man \
    --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR=${pkgdir}
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
