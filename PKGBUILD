# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Andrés R. <andthesito at gmail dot com>

pkgname=wmudmount
pkgver=3.0
pkgrel=1
pkgdesc='A filesystem mounter dockapp that uses udisks.'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/$pkgname/"
license=('GPL')
groups=('x11')
depends=('libnotify' 'udisks2' 'gcr')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('d92e3df7b1993cff3df3faf88a8df144')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

