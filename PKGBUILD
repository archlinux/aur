# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=2.9
pkgrel=4
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.net/picpuz/picpuz.html"
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('2ef3d1ac85dd4146bf547582c925ac1ed134499e184dc09857dfed5eae422a6c')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() { 
  cd $pkgname
  install -d "$pkgdir"/usr/share/icons
  make DESTDIR="$pkgdir" install
}
