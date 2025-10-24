# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=xorg-xfsinfo
pkgver=1.0.8
pkgrel=1
pkgdesc="X font server information utility"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libfs')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/xfsinfo-${pkgver}.tar.gz)
sha512sums=('ec5fbbdcb71b1a8ecde344dce6e01d46b8259a774ed14edbcdb521cdc7be0cb325e87b8c78682b5b8fcb79f3970c1723e37e8bc6a4f907be56e30fa4e4754637')

build() {
  cd xfsinfo-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd xfsinfo-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
