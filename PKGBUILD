# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=xorg-xfsinfo
pkgver=1.0.7
pkgrel=1
pkgdesc="X font server information utility"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libfs')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/xfsinfo-${pkgver}.tar.gz)
sha512sums=('b6e4126ec4cb0cf29257d479436f7b9232e9f36a83158ceca70baa45ba43a2af723aa057b21c36c77d6599db975827b5bd3a4500dfe1ced439c05291e8cbc3b0')

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
