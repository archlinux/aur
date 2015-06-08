# Maintainer: Gianluca Montecchi <gian@grys.it>
# Contributor: Sammy Fischer <sammy.fischer@gmail.com>

pkgname=sailcut
pkgver=1.3.5
pkgrel=2
pkgdesc="Sail design and plotting software" 
arch=(any)
url="http://www.sailcut.com/Sailcut_CAD" 
license=('GPL') 
depends=('qt4') 
makedepends=('cmake')
optdepends=()
backup=()
source=("http://downloads.sourceforge.net/project/sailcut/sailcut/Sailcut%20CAD%201.3.5/$pkgname-$pkgver.tar.gz" "sailcut.patch")
md5sums=('606e57c441dcf5fc8863f3366bccff50' '8e922c8b3970c883483920ba0eb4c0c4')

build() { 
	cd $srcdir/$pkgname-$pkgver 

	patch -p1 < ../sailcut.patch
  
	cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4  -DCMAKE_INSTALL_PREFIX=/usr .
	make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

