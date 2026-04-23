# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=silk
pkgver=3.24.1
pkgrel=1
pkgdesc="The System for Internet Level Knowledge (SiLK) is an efficient network flow collection and storage infrastructure that will accept flow data from a variety of sensors. SiLK also provides a suite of efficient command-line tools for analysis."
arch=('x86_64')
url="https://tools.netsa.cert.org/silk/index.html"
license=('GPL')
source=("https://tools.netsa.cert.org/releases/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('0754452f7eadc91d994476e9ce187fe5fce625d8696b7791e545f77df9a9f806')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
