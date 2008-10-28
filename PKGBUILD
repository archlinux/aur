# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfwm4-themes
pkgver=4.4.3
pkgrel=1
pkgdesc="A set of additionnal themes for the Xfce window manager"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("xfwm4>=${pkgver}")
makedepends=('pkgconfig')
options=('!libtool')
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0e713465f79a000958307c7f5b37185f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${pkgdir} install
}
