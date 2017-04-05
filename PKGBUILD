# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=cqrlog
pkgver=2.0.5
pkgrel=1
pkgdesc="An advanced ham radio logger based on MySQL database ( MariaDB replaces MySQL in repositories ). (Binary Version)"
arch=('i686' 'x86_64')
url="http://www.cqrlog.com"
license=('GPL')
groups=()

# cwdaemon not actuality now in AUR
#depends=('mysql' 'hamlib' 'trustedqsl' 'xplanet' 'cwdaemon' 'glabels')


depends=('mariadb' 'libmariadbclient' 'mariadb-clients' 'libmysqlclient' 'hamlib' 'trustedqsl' 'xplanet' 'glabels' )


if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    sha256sums=('i2b4d4abd4eb7d6a4956b3a249b62ebf554eb49d6933c3630d1f08f5d268579ce')

elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    sha256sums=('a822ee8b22c325de9308afd60b1a8393ee70cbc38fe2f193ab134dc516831fd9')
fi

_pkg="${pkgname//_/-}_${pkgver//_/-}_${_arch}"
source=($url/files/${pkgname//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    cd "${pkgname}-${pkgver}"
    cp -rfv ./* $pkgdir
}
