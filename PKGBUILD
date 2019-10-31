# Contributor: AlexTimmi <codelaunch@gmail.com>

pkgname=cqrlog-bin
_pkgname_sourse=cqrlog
pkgver=2.4.0
pkgrel=1
pkgdesc="An advanced ham radio logger based on MySQL database ( MariaDB replaces MySQL in repositories ). (Binary Version)"
arch=('x86_64')
url="http://www.cqrlog.com"
url_sourse="https://github.com/ok2cqr/cqrlog"
license=('GPL')
groups=()

depends=('mariadb' 'libmariadbclient' 'mariadb-clients' 'hamlib' 'trustedqsl' 'xplanet' 'glabels' )


if [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
sha256sums_x86_64=('c97e4123fe802a292040dddd2c80c7930e34abcde356950a197b5deedb9a56cb')
fi

_pkg="${_pkgname_sourse//_/-}_${pkgver//_/-}_${_arch}"
source_x86_64=($url_sourse/releases/download/v${pkgver}/${_pkg}.tar.gz)


package() {

    cd "${_pkgname_sourse}-${pkgver}"
    cp -rfv ./* $pkgdir
}
