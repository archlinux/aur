# Maintainer: Elvis Angelaccio <elvis dot angelaccio at kdemail dot net>

pkgname=kronometer
pkgver=1.6.0
pkgrel=1
pkgdesc="A simple chronometer application built for KDE."
arch=('i686' 'x86_64')
url="http://aelog.org/kronometer"
license=('GPL2')
depends=('kdelibs')
conflicts=('kronometer-git')
makedepends=('automoc4' 'cmake' 'make')
install=$pkgname.install
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('7c196902805a57ae8afc476e80fe534ca73900992aa551cdb9cab10a12e0f1f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
		  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
		  .
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
} 
