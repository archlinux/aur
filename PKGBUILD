# Maintainer: Ankit Tyagi <civil tyagi At GoogleMail Dot Com>
pkgname=getfem
pkgver=5.4.1
pkgrel=1
pkgdesc="A finite element framework to solve partial differential equations"
arch=('x86_64')
url="http://getfem.org"
license=('LGPL3')
depends=('python-numpy'
	 'python-scipy'
	 'qhull')
provides=('gmm')
conflicts=('gmm')
source=("http://download-mirror.savannah.gnu.org/releases/getfem/stable/$pkgname-$pkgver.tar.gz")
md5sums=('61988ac13d8a88fceb928b050c988220')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
		    --with-pic
	make
}
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  	rm -r "$pkgdir/usr/getfem_toolbox"
}
