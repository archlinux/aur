# Contributor: stefan husmann <stefan-husmann@t-online.de>
pkgname=galaxy2
pkgver=1.3
pkgrel=5
pkgdesc="Stellar Simulation"
url="http://www.kornelix.net/galaxy2/galaxy2.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('1e3692ff978f393fc1a29088fd96a4b50de4624bb35fc475fe9444d3141bda63')
options=('!emptydirs')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" install  
  rm "$pkgdir"/usr/share/doc/$pkgname/$pkgname.man
}
