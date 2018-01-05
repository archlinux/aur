# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=matchbox-keyboard
pkgver=0.1.1
pkgrel=1
pkgdesc="An on screen virtual keyboard"
arch=('x86_64')
depends=('cairo' 'libfakekey' 'libxft')
url="http://matchbox-project.org/"
license=('GPL')
source=("http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/snapshot/matchbox-keyboard-$pkgver.tar.bz2")
sha256sums=('44fc6dc6075090d6f8e43f8667cf8a85bed59b7221a5ee81843454c66e352790')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
