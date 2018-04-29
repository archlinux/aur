# Maintainer: lantw44 (at) gmail (dot) com

pkgname=ve
pkgver=1.1
pkgrel=2
pkgdesc="NTHU-CS Maple BBS 2.36 BBS-like editor"
arch=('x86_64' 'i686')
url="http://netlab.cse.yzu.edu.tw/~statue/freebsd/zh-tut/ve.html"
license=('custom')
depends=()
source=("http://distcache.freebsd.org/ports-distfiles/${pkgname}-${pkgver}.tgz"
        "ve-fix-build.patch")
sha256sums=('cbb6d0d2c4dd8ba68d96954c7519c94daefebcedfc285c0406e8a2029c317116'
            'a238fe1f71db1a4833b573b38e46cb5ed067754944a9a8df47f4e3480e104040')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/${source[1]}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
}
