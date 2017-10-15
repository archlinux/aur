# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=cqrlog
pkgver=2.1.0
pkgrel=1
pkgdesc="An advanced ham radio logger based on MySQL database ( MariaDB replaces MySQL in repositories ). (Binary Version)"
arch=('x86_64')
url="http://www.cqrlog.com"
license=('GPL')
groups=()

# cwdaemon not actuality now in AUR
#depends=('mysql' 'hamlib' 'trustedqsl' 'xplanet' 'cwdaemon' 'glabels')


depends=('mariadb' 'libmariadbclient' 'mariadb-clients' 'hamlib' 'trustedqsl' 'xplanet' 'glabels' )


if [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
sha256sums=('b79f8fa3de776e0697a6045d94d103d59ef1d27d091449b71a2eeaaf4e38c76d')
fi

_pkg="${pkgname//_/-}_${pkgver//_/-}_${_arch}"
source=($url/files/${pkgname//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    cd "${pkgname}-${pkgver}"
    cp -rfv ./* $pkgdir
}
