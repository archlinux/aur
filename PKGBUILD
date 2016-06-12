# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=cqrlog
pkgver=2.0.1
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
    sha256sums=('d11452272bba74635ede4481793eaa0c3b41fc97d22bcdd5067dfa874d6c12bc')

  elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    sha256sums=('603aa4016f1eb6dcaa7acb234e1982ab930398a5f607807b3a597e8e4fa1ebce')
fi

_pkg="${pkgname//_/-}_${pkgver//_/-}_${_arch}"
source=($url/files/${pkgname//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    _cqrpath="$srcdir/${pkgname//_/-}_${pkgver//_/-}_${_arch}"

    cd "${_cqrpath}"
    cp -rfv ./* $pkgdir
}
