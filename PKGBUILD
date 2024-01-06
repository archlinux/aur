# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=guile-wisp
pkgver=1.0.11
pkgrel=1
pkgdesc="Whitespace to Lisp"
arch=('x86_64')
url="https://www.draketo.de/software/wisp"
license=('GPL3')
depends=('guile')
makedepends=('python')
source=("$pkgname-$pkgver.tar.gz::https://hg.sr.ht/~arnebab/wisp/archive/v$pkgver.tar.gz")
sha256sums=('efe99873e88ddb908d0357c7f80ed33b99ff2ac572e227a0d9aaa9632e92a2fb')

build() {
  cd "wisp-v$pkgver"
  autoreconf -vi
  ./configure --datarootdir=/usr/share
  make
}

package() {
  cd "wisp-v$pkgver"
  make DESTDIR="$pkgdir/" install
}

