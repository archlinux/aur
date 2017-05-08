# Maintainer: Juri Grabowski <gratuxri@gmail.com>

pkgname=tina
pkgver=0.1.12
pkgrel=0
pkgdesc="tina is a personal information manager with a curses interface. It allows the user to categorize short text items and to display the items in a particular category."
arch=(any)
url="http://devel.ringlet.net/misc/tina/"
license=(GPL PerlArtistic)
depends=(perl)
options=('!emptydirs')
_author="Peter Pentchev <roam@ringlet.net>"
source=("http://devel.ringlet.net/files/misc/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('c0121de5f9c414b56512408879ba5d35')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install 
}
