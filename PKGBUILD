# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=storaged
pkgver=2.6.2
pkgrel=1
pkgdesc="LVM DBus add-on for udisks"
url="https://github.com/storaged-project/storaged"
license=('LGPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('udisks2' 'lvm2')
makedepends=('intltool' 'gobject-introspection' 'libxslt' 'docbook-xml' 'docbook-xsl')
source=(https://github.com/storaged-project/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('9106421b269a00ec65a4bc3090d6d121')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
