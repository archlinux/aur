# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=3.8
pkgrel=2
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('d25fb3b3941491cc73f403b5e74df8c3db21363aeaa351410f9587297feb1022')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  chmod 755 "$pkgdir"/usr/bin/$pkgname
  rmdir "$pkgdir"/usr/share/{appdata,$pkgname/locales}
}
