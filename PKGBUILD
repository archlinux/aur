# $Id: PKGBUILD,v 1.18 2007/12/04 07:56:58 tobias Exp $
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfwm4-themes
pkgver=4.4.2
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
md5sums=('fbea3ef7eec87fd669958f9cf597bfb8')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
