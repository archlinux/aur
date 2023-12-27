# Maintainer: robertfoster
# Contributor: <kfgz at interia dot pl>

pkgname=nwipe
pkgver=0.35
pkgrel=3
pkgdesc="A fork of the dwipe command that will securely erase disks using a variety of recognised methods"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.andybev.com/index.php/Nwipe"
depends=('hdparm' 'libconfig' 'ncurses' 'parted')
optdepends=('coreutils' 'dmidecode' 'smartmontools')
license=('GPL2')
source=("https://github.com/martijnvanbrummelen/nwipe/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

sha256sums=('323e79a4861f96aed75369a5b9048791a8aca1e72c9d8e1c87531346cba6a7ab')
