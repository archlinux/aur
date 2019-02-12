# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: stefan husmann <stefan-husmann@t-online.de>

pkgname=picpuz
pkgver=2.9
pkgrel=5
pkgdesc="'jigsaw puzzle' program."
arch=('i686' 'x86_64')
url="http://www.kornelix.net/picpuz/picpuz.html"
license=('GPL3')
depends=('gtk3')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('fbb761f0a6fe33932d7440f6f9d12410b5ef6d9a3a6304c32626cd61dfb0911a')
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
