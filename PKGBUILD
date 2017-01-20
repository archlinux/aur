# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=cqrlog
pkgver=2.0.4
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
    sha256sums=('86d19ba6e60c301d82d12d8f355fee5f300a6b8b85dcc3880059b9cf4829e489')

  elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    sha256sums=('416eb630ab5d4d266f759fa1ffd7706c7d074b7bfdd9c5912510bfb3d516b84f')
fi

_pkg="${pkgname//_/-}_${pkgver//_/-}_${_arch}"
source=($url/files/${pkgname//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    cd "${pkgname}-${pkgver}"
    cp -rfv ./* $pkgdir
}
