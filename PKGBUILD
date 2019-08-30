# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=alex4
pkgver=1.2.1
pkgrel=1
pkgdesc="Help Alex the Allegator rescue Lola before the humans make a pair of shoes out of her!"
url="http://allegator.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('aldumb' 'allegro4')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/carstene1ns/alex4/archive/$pkgver.tar.gz")
sha256sums=('f0bdb6f23c858628de8c74b6625d51eccf6b927ecb21744a25dd58d6e02c4c5f')

build() {
  make -C $pkgname-$pkgver PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DESTDIR="$pkgdir/" install
  # config
  install -Dm0644 alex4.ini "$pkgdir"/usr/share/alex4/alex4.ini
}
