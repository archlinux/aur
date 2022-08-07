# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=xorg-xfs
pkgver=1.2.1
pkgrel=2
pkgdesc="X Font Server"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libxfont2')
makedepends=('xtrans')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/xfs-${pkgver}.tar.gz)
sha512sums=('716bb6b85cd6ece72f035eb5a7aaa4f36dfa4b2e899bef224c5080910bb91dd442c4e5e2a175d53a23702b1d3d7d8e403e8f092b590f5decaa72827d95adf96c')

build() {
  cd xfs-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd xfs-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

