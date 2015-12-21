# Maintainer: M0Rf30
# Contributor: <kfgz at interia dot pl>

pkgname=nwipe
pkgver=0.17
pkgrel=1
pkgdesc="A fork of the dwipe command that will securely erase disks using a variety of recognised methods"
arch=('i686' 'x86_64')
url="http://www.andybev.com/index.php/Nwipe"
depends=('device-mapper' 'ncurses' 'parted')
license=('GPL2')
source=("https://github.com/martijnvanbrummelen/nwipe/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./init.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

md5sums=('05201bacf469d53177b3c2a3c80fc492')
