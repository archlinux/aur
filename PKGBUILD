# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=storaged
pkgver=2.6.3
pkgrel=2
pkgdesc="LVM DBus add-on for udisks"
url="https://github.com/storaged-project/storaged"
license=('LGPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
conflicts=('udisks2')
provides=('udisks2')
depends=('polkit' 'libatasmart' 'libgudev')
makedepends=('intltool' 'gobject-introspection' 'libxslt' 'docbook-xml' 'docbook-xsl')
source=(https://github.com/storaged-project/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1575f9539395ca78ae0efe3467785aa1')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
