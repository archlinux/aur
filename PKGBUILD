# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duff
pkgver=0.5.2
pkgrel=2
pkgdesc="A command-line utility for quickly finding duplicates in a given set of files"
arch=('i686' 'x86_64')
url="http://duff.dreda.org/"
license=('custom')
depends=('glibc' 'sh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/elmindreda/$pkgname/archive/$pkgver.tar.gz")
md5sums=('e4688d2724e1990d7d36ecb89f114f9e')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}

