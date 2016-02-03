# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=storaged
pkgver=2.4.0
pkgrel=2
pkgdesc="LVM DBus add-on for udisks"
url="https://github.com/storaged-project/storaged"
license=('LGPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('udisks2' 'lvm2')
makedepends=('intltool' 'gobject-introspection' 'libxslt' 'docbook-xml')
source=(https://github.com/storaged-project/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b51080d5e91d663c21c07149f1553f94')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
