# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=sysexxer
pkgver=0.3
pkgrel=1
pkgdesc="A tool to send and receive MIDI SysEx data"
arch=('i686' 'x86_64')
url="http://www.christeck.de/wp/products/simple-sysexxer/"
license=('GPL')
depends=('qt4')
makedepends=('make' 'gcc')
source=(http://downloads.sourceforge.net/project/sysexxer/SimpleSysexxer-$pkgver/SimpleSysexxer-$pkgver.tar.gz)
md5sums=('59c1b91089bb15050e3a58aa602332db')

build() {
  cd "$srcdir/SimpleSysexxer-$pkgver"
  qmake-qt4 SimpleSysexxer.pro
  make
}

package() {
  cd "$srcdir/SimpleSysexxer-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  mv "$pkgdir/usr/local/bin" "$pkgdir/usr"
  rm -Rf "$pkgdir/usr/local"
}

# vim:set ts=2 sw=2 et:
