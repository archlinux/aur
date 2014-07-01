# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sbxkb
pkgver=0.7.6
pkgrel=2
pkgdesc="Simple tray XKB indicator"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.sourceforge.net/project/staybox"
depends=('gtk2')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/project/staybox/${pkgname}-${pkgver}.tar.gz)
md5sums=('25dc697817a2952a4468c5d2a2f206d2')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export LDFLAGS=-lX11
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
