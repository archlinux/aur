# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=xorg-mkcomposecache
pkgver=1.2.2
pkgrel=1
pkgdesc="X.Org Compose file cache creator"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libx11')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/mkcomposecache-${pkgver}.tar.gz)
sha512sums=('616412df0595a858e378903e26af92471a052375510d13e476a64a2c29e942e93e263e39a8e649376c4a11de4534c7f7b3ee398cdeb6d51d6a2d52451c2c486f')

build() {
  cd mkcomposecache-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd mkcomposecache-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

