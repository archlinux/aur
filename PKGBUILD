# Maintainer: robertfoster
# Contributor: <kfgz at interia dot pl>

pkgname=nwipe
pkgver=0.40 # renovate: datasource=github-tags depName=martijnvanbrummelen/nwipe
pkgrel=1
pkgdesc="A fork of the dwipe command that will securely erase disks using a variety of recognised methods"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/martijnvanbrummelen/nwipe"
depends=('hdparm' 'libconfig' 'ncurses' 'parted')
optdepends=('coreutils' 'dmidecode' 'smartmontools')
license=('GPL2')
source=("${url}/archive/v${pkgver}.tar.gz")

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

sha256sums=('826ff4431324cc06f34da7a86829cd5c1a1bb10cf5528bbe7d07676816b813f8')
