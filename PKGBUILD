# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=silk
pkgver=3.22.1
pkgrel=1
pkgdesc="The System for Internet Level Knowledge (SiLK) is an efficient network flow collection and storage infrastructure that will accept flow data from a variety of sensors. SiLK also provides a suite of efficient command-line tools for analysis."
arch=('x86_64')
url="https://tools.netsa.cert.org/silk/index.html"
license=('GPL')
source=("https://tools.netsa.cert.org/releases/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('e10096e9fa4ef4980cfff300b8f7a0aed6a8e8f172b444e43dd79ed7e05a7e02')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
