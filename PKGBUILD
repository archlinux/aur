# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=lbench  
pkgver=3.8
pkgrel=3
pkgdesc="Simple Linux multithread benchmarking tool"
url="http://www.kornelix.net/lbench/lbench.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('f715daa06d81ec15d70af2b7ca09b1f04192b8b7e30882a89a1283572754537b')

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
