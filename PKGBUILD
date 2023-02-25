# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=guile-wisp
pkgver=1.0.10
pkgrel=1
pkgdesc="Whitespace to Lisp"
arch=('x86_64')
url="https://www.draketo.de/software/wisp"
license=('GPL3')
depends=('guile')
source=("$pkgname-$pkgver.tar.gz::https://hg.sr.ht/~arnebab/wisp/archive/v$pkgver.tar.gz")
sha256sums=('c04e1b2393a5f5c9262f2977ef747e33cef9e9bee03a20cdc7fe0a86f141be41')

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

