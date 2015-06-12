# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Alexander Dzhoganov
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=xmacro
pkgver=0.4.6
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="Recording and replaying keyboard and mouse events on an X server"
url="http://download.sarine.nl/xmacro/Description.html"
depends=('xorg-server')
source=("http://download.sarine.nl/xmacro/$pkgname-$pkgver.tar.gz")
md5sums=('c1648529aab8d65a92ad43513b9815c5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 xmacrorec2 "$pkgdir/usr/bin/xmacrorec2"
  install -Dm755 xmacroplay "$pkgdir/usr/bin/xmacroplay"
}

