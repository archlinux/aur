# Contributor: gtmanfred
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=socketw
pkgver=031026
pkgrel=6
pkgdesc="a cross platform streaming socket C++ library"
arch=('i686' 'x86_64')
url="http://www.digitalfanatics.org/cal/socketw/"
depends=('openssl')
license=('GPL-2')
#source=(http://www.digitalfanatics.org/cal/socketw/files/SocketW${pkgver}.tar.gz http://wiki.rigsofrods.com/images/c/c0/Socketw.patch)
source=(http://pkgs.fedoraproject.org/repo/pkgs/SocketW/SocketW031026.tar.gz/8faf5f9413ae0f741c758f03db49cbef/SocketW${pkgver}.tar.gz http://wiki.rigsofrods.com/images/c/c0/Socketw.patch)
md5sums=('8faf5f9413ae0f741c758f03db49cbef'
         'af2a36995042c10fd2f13792ef338c2d')

build() {
  cd $srcdir/SocketW${pkgver}
  patch -Np0 -i $srcdir/Socketw.patch -d src
  make --silent shared
}

package() {
  cd $srcdir/SocketW${pkgver}
  make PREFIX=$pkgdir/usr install
}
