# Maintainer: Kevin Baxmann <kvbx@kvbx.de>
# Previous Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver=21.1.1.113.1704
pkgrel=1
pkgdesc="SQL Developer command line interface for Oracle"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/developer-tools/sqlcl/overview/index.html"
license=('custom:OTN')
depends=('java-runtime>=8')

source=("LICENSE"
        "https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-${pkgver}.zip"
        "sqlcl.sh")
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
            'ac31dc1bef29bbf972f35d000a4ef9669941038ff503655ac804e35df15e1dfc'
            '4a0469c0adc964d91c611a643075087235dc2de8332e87297abe9865d19c2a14')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/opt/${pkgname}/lib
  install -d ${pkgdir}/opt/${pkgname}/bin
  install -d ${pkgdir}/opt/${pkgname}/lib/ext
  install -d ${pkgdir}/usr/bin
  install -m 644 ${pkgname}/lib/*.jar ${pkgdir}/opt/${pkgname}/lib
  install -m 644 ${pkgname}/lib/ext/*.jar ${pkgdir}/opt/${pkgname}/lib/ext
  install -m 755 ${pkgname}/bin/sql ${pkgdir}/opt/${pkgname}/bin/sql
  install -m 755 ${srcdir}/sqlcl.sh ${pkgdir}/usr/bin/sqlcl
}
