# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>

pkgname=httest
pkgver=2.1.5
pkgrel=1
pkgdesc="HTTP Test Tool"
arch=('i686' 'x86_64')
url="http://htt.sourceforge.net"
license=('APACHE')
source=("http://downloads.sourceforge.net/project/htt/htt2.1/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-guide.pdf::http://downloads.sourceforge.net/project/htt/htt2.1/${pkgname}-${pkgver}/users-guide.pdf")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure  --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cd ${srcdir}
  cp "${pkgname}-${pkgver}-guide.pdf" ${pkgdir}/usr/share/doc/${pkgname}/users-guide.pdf
}
sha1sums=('d29f344ed4c6ef0fdefed472b23bfa9f3c198ea0'
          'eeb7b22ce960ec81171a481295b6763981a45dca')
