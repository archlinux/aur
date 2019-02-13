# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=silk
pkgver=3.18.0
pkgrel=1
pkgdesc="The System for Internet Level Knowledge (SiLK) is an efficient network flow collection and storage infrastructure that will accept flow data from a variety of sensors. SiLK also provides a suite of efficient command-line tools for analysis."
arch=('x86_64')
url="https://tools.netsa.cert.org/silk/index.html"
license=('GPL')
source=("https://tools.netsa.cert.org/releases/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('26e1b2fb3c0e41b5cbe66b91976ffd65d66bfb1263cfae459f3773c296fcb3b6')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
