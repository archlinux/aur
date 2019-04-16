# Maintainer: Arne Hoch <arne@derhoch.de>

pkgname=sqlcl
pkgver=19.1.0.094.1619
pkgrel=1
pkgdesc="SQL Developer command line interface for Oracle"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/developer-tools/sqlcl/overview/index.html"
license=('custom:OTN')
depends=('java-runtime>=8')

# Fail if retrieval is attempted of any of the manual:// URLs
DLAGENTS+=('manual::/usr/bin/false');

source=("LICENSE"
        "manual://${pkgname}-${pkgver}.zip"
        "sqlcl.sh")
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
            '8e2c02f92846d72aadd74cac7869506d281e45061447887ba1098ace2694c267'
            '4a0469c0adc964d91c611a643075087235dc2de8332e87297abe9865d19c2a14')

msg "Warning: This software cannot be downloaded automatically."
plain "You will need to sign up for an Oracle account and download the software from"
plain "Oracle directly.  Place the downloaded file in the same directory as the"
plain "PKGBUILD and re-run makepkg."
plain ""
plain "The source .zip files can be downloaded from:"
plain ""
plain "https://www.oracle.com/technetwork/developer-tools/sqlcl/overview/index.html"
plain ""
plain ""

package() {
  cd ${srcdir}
  install -d ${pkgdir}/opt/${pkgname}/lib
  install -d ${pkgdir}/opt/${pkgname}/bin
  install -d ${pkgdir}/usr/bin
  install -m 644 ${pkgname}/lib/*.jar ${pkgdir}/opt/${pkgname}/lib
  install -m 755 ${pkgname}/bin/sql ${pkgdir}/opt/${pkgname}/bin/sql
  install -m 755 ${srcdir}/sqlcl.sh ${pkgdir}/usr/bin/sqlcl
}
