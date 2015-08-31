#Maintainer GI_Jack <iamjacksemail@hackermail.com>

pkgname=libsecuredelete
pkgver=0.2.1
pkgrel=3
pkgdesc="GObject wrapper library for nautilus-wipe"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('polkit' 'secure-delete')
url="http://wipetools.tuxfamily.org/libgsecuredelete.html"
source=("http://download.tuxfamily.org/wipetools/releases/libgsecuredelete/libgsecuredelete-$pkgver.tar.gz")
sha256sums=('d1d7b2c122668ebc3c76d7f0faf8e2858e8e69a76165782b556f31d6d5a11a7d')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

