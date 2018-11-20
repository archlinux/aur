# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=silk
pkgver=3.17.2
pkgrel=1
pkgdesc="The System for Internet Level Knowledge (SiLK) is an efficient network flow collection and storage infrastructure that will accept flow data from a variety of sensors. SiLK also provides a suite of efficient command-line tools for analysis."
arch=('x86_64')
url="https://tools.netsa.cert.org/silk/index.html"
license=('GPL')
source=("https://tools.netsa.cert.org/releases/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('70b74eceafce7b724ceccd9e801909f4bd28985406eb8c42a94c8d25e7d58194')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
