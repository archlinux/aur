# Maintainer: lantw44 (at) gmail (dot) com

pkgname=ve
pkgver=1.1
pkgrel=1
pkgdesc="NTHU-CS Maple BBS 2.36 BBS-like editor"
arch=('x86_64' 'i686')
url="http://netlab.cse.yzu.edu.tw/~statue/freebsd/zh-tut/ve.html"
license=('custom')
depends=()
source=("ftp://freebsd.csie.nctu.edu.tw/pub/distfiles/${pkgname}-${pkgver}.tgz"
        "0001-Fix-incorrent-build-parameters.patch")
md5sums=('8614598698ce0811c880714530f5892d'
         'f061844a40d70f245fb083b48f5b83cc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < ../0001-Fix-incorrent-build-parameters.patch
  unset CPPFLAGS
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX="${pkgdir}/usr" install
}
