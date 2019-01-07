# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Alexander Dzhoganov
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
pkgname=xmacro
pkgver=0.4.6
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Recording and replaying keyboard and mouse events on an X server"
url="http://download.sarine.nl/xmacro/Description.html"
depends=('xorg-server' 'libxtst')
source=("http://download.sarine.nl/xmacro/$pkgname-$pkgver.tar.gz")
sha256sums=('c1c41bdbebaae38ac14537dfa5e05f124ae4ccee22fa2869bc4612ebbba432dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 xmacrorec2 "$pkgdir"/usr/bin/xmacrorec2
  install -Dm755 xmacroplay "$pkgdir"/usr/bin/xmacroplay
}
