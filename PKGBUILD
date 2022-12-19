# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=silk
pkgver=3.19.2
pkgrel=1
pkgdesc="The System for Internet Level Knowledge (SiLK) is an efficient network flow collection and storage infrastructure that will accept flow data from a variety of sensors. SiLK also provides a suite of efficient command-line tools for analysis."
arch=('x86_64')
url="https://tools.netsa.cert.org/silk/index.html"
license=('GPL')
source=("https://tools.netsa.cert.org/releases/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('358ba718208dcfb14a22664a6d935f343bd7a1976729e5619ba7c702b70e3a7d')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
