# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=storaged
pkgver=2.1.2
pkgrel=1
pkgdesc="LVM DBus add-on for udisks"
url="https://github.com/storaged-project/storaged"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('udisks2' 'lvm2')
makedepends=('intltool' 'gobject-introspection' 'libxslt')
source=(https://github.com/storaged-project/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c10c2e027d639de75118ff104746d685')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
