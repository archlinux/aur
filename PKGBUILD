# Contributor: Paul Nicholson <brenix@gmail.com>

pkgname=dirr
pkgver=3.36.6
pkgrel=1
pkgdesc="List directories and files in *nix system. A colourful alternative for /bin/ls"
url="http://bisqwit.iki.fi/source/dirr.html"
arch=('i686' 'x86_64')
makedepends=("clang")
license=('GPL')
source=("http://bisqwit.iki.fi/src/arch/$pkgname-$pkgver.tar.bz2")
md5sums=('b5a083dfaf2b30f74c002d58443d5406')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make BINDIR="$pkgdir/usr/bin" install
}

# vim: ft=sh syn=sh
