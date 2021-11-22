#  Maintainer: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Matthias Hueser <mail at mhueser dot de>
# Contributor: Daniel Griffiths <ghost1227 at archlinux dot us>

pkgname=rolo
pkgver=019
pkgrel=1
pkgdesc="Tracks contacts with vCards and displays them with a text-based menu."
arch=('i686' 'x86_64')
url="https://github.com/libvc/rolo"
license=('GPL')
depends=('ncurses' 'libvc' 'libunac')

source=(
rolo-${pkgver}.tar.gz::https://github.com/libvc/rolo/archive/v${pkgver}.tar.gz
rolo-${pkgver}.tar.gz.sig::https://github.com/libvc/rolo/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig
)

build() {
  cd $srcdir/$pkgname-$pkgver

  autoreconf -i -f
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

validpgpkeys=('3F464391498FE874BDB5D98F2124AA1983785C90')

sha256sums=(
    'c88a02087dd5820a32fb85c9573d97cb73dfd6136509784ac79f62726284dac7'
    'a43a69035046a3c160c03b2a237692ce39c1a06fdb87b795cff0d6156d686206'
)
