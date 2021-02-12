# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=wyslij-po
pkgver=3.3
pkgrel=1
pkgdesc="Submit PO files to the Translation Project"
arch=('x86_64')
url="https://puszcza.gnu.org.ua/software/wyslij-po/"
license=('GPL')
depends=('mailutils')
source=(ftp://download.gnu.org.ua/pub/release/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
md5sums=('7ef48edc639f9cbbe9f762be2096ff92'
         'SKIP')
sha1sums=('b3f0e0a6c9024825865edf291ce8bb02175c1b5c'
          'SKIP')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')
   # Sergey Poznyakoff <gray@gnu.org>
   # To validate, see instructions at:
   #   https://puszcza.gnu.org.ua/software/wyslij-po/download.html

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
