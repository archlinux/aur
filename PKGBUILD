# Maintainer: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=xfwm4-themes
pkgver=4.6.0
pkgrel=2
pkgdesc="A set of additional themes for the Xfce window manager"
arch=('any')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('xfwm4')
makedepends=('pkgconfig')
options=('!libtool')
source=("http://archive.xfce.org/xfce/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=('4dc5cb29cbd40e3b9dece12a85e20854')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
