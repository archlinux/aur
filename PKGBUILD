# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: rabyte <rabyte*gmail>

pkgname=pcspk
pkgver=0.0.6
pkgrel=3
pkgdesc="A set of command line applications for using the PC speaker"
arch=('i686' 'x86_64')
url="https://github.com/przemoc/pcspk"
license=('GPL2')
options=('strip' '!buildflags')
source=(http://download.przemoc.net/$pkgname-$pkgver.tar.gz)
md5sums=('41b4e81c3c6c56e6171b746049a688a1')

build() {
  cd $pkgname-$pkgver
  ETCDIR=/etc make
}

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/pcspk"
  make PREFIX="$pkgdir/usr" SBINDIR="$pkgdir/usr/bin" install
  install -Dm644 README "$pkgdir/usr/share/doc/pcspk/"
}