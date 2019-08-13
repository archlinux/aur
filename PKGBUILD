# Maintainer: Max Medar <max at medar dot pp dot ua>

pkgname=simple-fb2-reader
pkgver=1.1.3
pkgrel=1
pkgdesc="Simple FB2 book reader on GTK+3"
arch=('i686' 'x86_64')
url="http://github.com/Cactus64k/simple-fb2-reader"
license=('GPL3')
depends=('libxml2>=2.9.4' 'gtk3>=3.24.10' 'libzip>=1.5.1' 'sqlite>=3.29.0')
makedepends=('debhelper>=12.3' 'gettext>=0.19.8' 'pkgconf>=0.29' 'cmake>=3.13.4')
install=$pkgname.install
source=(http://github.com/Cactus64k/simple-fb2-reader/archive/$pkgver.tar.gz)
md5sums=('ef5cf7266d37912ecf9018f51657cb64')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $srcdir/simple-fb2-reader-$pkgver
  #./configure --prefix=/usr --sysconfdir=/etc
  cmake CMakeLists.txt
  make
}

package() {
  cd $srcdir/simple-fb2-reader-$pkgver
  make DESTDIR=$pkgdir install
}

