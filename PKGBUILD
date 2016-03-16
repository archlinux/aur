# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=bareftp
pkgver=0.3.12
pkgrel=1
pkgdesc="bareFTP a file transfer client supporting the FTP, FTPS and SFTP protocols"
arch=('i686' 'x86_64')
url="http://www.bareftp.org/"
license=('GPL')
depends=('gnome-sharp>=2' 'gnome-icon-theme' 'gnome-keyring-sharp' 'mono>=2')
makedepends=('intltool>=0.35' 'pkgconfig>=0.9')
install=$pkgname.install
source=(http://www.bareftp.org/release/$pkgname-$pkgver.tar.gz)
sha256sums=('efb22c6b03a84a74ad734e493d5fa711b2c6cfea75db1bedf68c713a31d62727')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  export MONO_SHARED_DIR=$(pwd)
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

