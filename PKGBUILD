# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Don Harper <duck at duckland dot org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: froggie <sullivanva@gmail.com>

pkgname=xlhtml
pkgver=0.5.1
pkgrel=6
pkgdesc="An Excel spreadsheet (.xls) and PowerPoint (.ppt) to HTML converter"
#arch=('i686')
arch=('x86_64')
url="http://chicago.sourceforge.net/xlhtml/"
license=('GPL')
source=("http://www.asahi-net.or.jp/~yw3t-trns/namazu/xlhtml/xlhtml-0.5.1.tar.gz")
sha256sums=('81fb9e786bb7c440423566b0aa71d7395685dd4566a8388a4d89ee6a8a5cd873')

build() {
  export CPP=/usr/bin/cpp
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --mandir="$pkgdir/usr/share/man" --build=i686-linux
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr" install
}
