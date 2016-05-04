# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=storaged
pkgver=2.5.1
pkgrel=1
pkgdesc="LVM DBus add-on for udisks"
url="https://github.com/storaged-project/storaged"
license=('LGPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('udisks2' 'lvm2')
makedepends=('intltool' 'gobject-introspection' 'libxslt' 'docbook-xml')
source=(https://github.com/storaged-project/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('cf2c4ed708c581dab4576535c6ba5a63')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
