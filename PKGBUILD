# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=bdt
pkgver=0.10.0
pkgrel=1
pkgdesc="Herramienta LFS"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/bdt"
depends=('octetos-core')
md5sums=('db8d822c1a958f1644468f02258b5bd2')
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
