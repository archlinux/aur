# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: detto <detto-brumm@freenet.de>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-murrine
pkgver=0.98.2
pkgrel=2
pkgdesc="GTK2 engine to make your desktop look like a 'murrina', an italian word meaning the art glass works done by Venicians glass blowers."
arch=('i686' 'x86_64')
url="http://cimitan.com/murrine/project/murrine"
license=('LGPL3')
depends=('gtk2')
makedepends=('intltool')
source=(http://ftp.gnome.org/pub/GNOME/sources/murrine/0.98/murrine-${pkgver}.tar.xz)
sha256sums=('e6a2af72674403d06c03e067d915004e8d9cdeec206f3350c7f3ee595b139912')
sha256sums=('e9c68ae001b9130d0f9d1b311e8121a94e5c134b82553ba03971088e57d12c89')

build() {
  cd murrine-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-animation \
    --enable-animationrtl
  make
}

package() {
  cd murrine-${pkgver}
  make DESTDIR=${pkgdir} install
}
