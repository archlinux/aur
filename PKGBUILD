# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=guile-wisp
pkgver=1.0.8
pkgrel=1
pkgdesc="Whitespace to Lisp"
arch=('x86_64')
url="https://www.draketo.de/software/wisp"
license=('GPL3')
depends=('guile')
source=("$pkgname-$pkgver.tar.gz::https://hg.sr.ht/~arnebab/wisp/archive/v$pkgver.tar.gz")
sha256sums=('a504440737ed6a36e271610f143e1977f0f33103b1988560270d2bf2dd41d617')

build() {
  cd "wisp-v$pkgver"
  autoreconf -i
  ./configure --datarootdir=/usr/share
  make
}

package() {
  cd "wisp-v$pkgver"
  make DESTDIR="$pkgdir/" install
}

