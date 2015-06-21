# Maintainer: Maarten van Gompel <proycon at anaproy dot nl>
# Contribuor: Bart Verhoeven <nepherte at archlinux dot us>
pkgname=mbtserver
pkgver=0.9
pkgrel=1
pkgdesc="Memory-based tagger-generator and tagger server."
arch=('i686' 'x86_64')
license=('GPL3')
depends=('ticcutils' 'timbl' 'timblserver' 'mbt')
makedepends=()
options=(!libtool)
url="http://ilk.uvt.nl/mbt"
source=("http://software.ticc.uvt.nl/$pkgname-$pkgver.tar.gz")
md5sums=('09b7b6978df17920dd0e28384c3013f3')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

