# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Maintainer : vic.pozd <vic.pozd at gmail.com>

pkgname=cqrlog
pkgver=1.9.0
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
    md5sums=('7384c493b8c62eb6867861586d3eca9f')

  elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    md5sums=('31d3d8f745727fcdbc12f1452b7a8a5f')
fi

_pkg="${pkgname//_/-}_${pkgver//_/-}_${_arch}"
source=($url/files/${pkgname//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    _cqrpath="$srcdir/${pkgname//_/-}_${pkgver//_/-}_${_arch}"

    cd "${_cqrpath}"
    cp -rfv ./* $pkgdir
}
