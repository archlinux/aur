# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tomasz Gorol <gavian at tlen dot pl>

pkgname=ftmenu
pkgver=0.4.0
pkgrel=2
pkgdesc="Fluxbox menu icon tray"
arch=('i686' 'x86_64')
url="http://ftmenu.sourceforge.net/"
license=('GPL')
depends=('fluxbox' 'gtk2')
source=("http://sourceforge.net/projects/ftmenu/files/ftmenu/ftmenu-0.4/${pkgname}-${pkgver}.tar.gz/download")
md5sums=('7a56d92be35970e66c45abe72d50653e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
