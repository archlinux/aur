# Maintainer: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=xfwm4-themes
pkgver=4.5.99.1
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
md5sums=('91fc3d42f7af94944ee1b64efaaf2b7b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${pkgdir} install
}
