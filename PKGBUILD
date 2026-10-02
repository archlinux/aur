# Maintainer: robertfoster
# Contributor: <kfgz at interia dot pl>

pkgname=nwipe
pkgver=0.43 # renovate: datasource=github-tags depName=martijnvanbrummelen/nwipe
pkgrel=1
pkgdesc="A fork of the dwipe command that will securely erase disks using a variety of recognised methods"
arch=('x86_64' 'aarch64')
url="https://github.com/martijnvanbrummelen/nwipe"
depends=('hdparm' 'libconfig' 'ncurses' 'parted')
optdepends=('coreutils' 'dmidecode' 'smartmontools')
license=('GPL-2.0-or-later')
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

sha256sums=('b1e9d94e1879934db688bce9515111ef6b0599b2244fdca2625a2e87e2d8e221')
