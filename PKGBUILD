# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>

pkgname=stacktrace
pkgver=1.2.1
pkgrel=1
pkgdesc="Javalike stacktrace for ELF binaries"
arch=(any)
url="http://www.nopcode.org/wk.php/stacktrace"
license=("GPL")
source=("http://kung-foo.net/killabyte/code/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('9e6e632dfe72baa95d95e2aa9c32054b673cec2a')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}/
  make
}


package(){
  cd ${srcdir}/${pkgname}-${pkgver}/
  make \
    DOCDIR=${pkgdir}/usr/share/doc/${pkgname} \
    BINDIR=${pkgdir}/usr/bin \
    INCDIR=${pkgdir}/usr/include \
    LIBDIR=${pkgdir}/usr/lib \
    install
}
# vim: sw=2:ts=2 et:
