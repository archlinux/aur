# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=pkmt
pkgver=0.11.0
pkgrel=1
pkgdesc="Herramienta LFS"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/pkmt"
depends=('octetos-coreutils' 'libconfig' 'bdt' 'cunit' 'curl')
md5sums=('73e83dfe8522e1fe660e236fd3f11f2d')
source=(https://github.com/azaeldevel/$pkgname/archive/$pkgver-alpha.tar.gz)


build() {
    cd $pkgname-$pkgver-alpha
	autoreconf -fi
	./configure --prefix=/usr --sysconfdir=/etc
}

package() {
  cd $pkgname-$pkgver-alpha
  make DESTDIR="$pkgdir" install
}
