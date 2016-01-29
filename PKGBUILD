# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=wmnet
pkgver=1.06
pkgrel=5
pkgdesc="A network monitor applet for WindowMaker"
arch=('i686' 'x86_64')
url="http://www.katharineosborne.com/wmnet/"
license=('GPL')
depends=('libxext')
makedepends=('imake')
source=("$pkgname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd dockapps-*
  xmkmf
  make
}
package() {
  cd dockapps-*
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
}
