# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=xorg-fstobdf
pkgver=1.0.7
pkgrel=1
pkgdesc="generate BDF font from X font server"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libfs' 'libx11')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/fstobdf-${pkgver}.tar.gz)
sha512sums=('ba57916bb8363a5bdfd6b05e69a380fa7541c093cceb5bce7c095dff8bc8f8ab21cf4a32127020c0327ce24cad795896854e328e17af1af7a2bb14fc7f7749b4')

build() {
  cd fstobdf-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd fstobdf-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
