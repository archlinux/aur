#Maintainer GI_Jack <iamjacksemail@hackermail.com>

pkgname=libgsecuredelete
pkgver=0.3
pkgrel=2
pkgdesc="GObject wrapper library for nautilus-wipe"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('polkit' 'secure-delete')
makedepends=('vala')
url="http://wipetools.tuxfamily.org/libgsecuredelete.html"
source=("http://download.tuxfamily.org/wipetools/releases/libgsecuredelete/libgsecuredelete-$pkgver.tar.gz")
sha256sums=('c158b51f94fad07f201e88cb8e83bdbde70a15c6d8539a213f12145b3e36040e')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

