# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: rabyte <rabyte*gmail>

pkgname=pcspk
pkgver=0.0.6
pkgrel=2
pkgdesc="A set of command line applications for using the PC speaker"
arch=('i686' 'x86_64')
url="https://github.com/przemoc/pcspk"
license=('GPL2')
options=('strip' '!buildflags')
source=(http://download.przemoc.net/$pkgname-$pkgver.tar.gz)
md5sums=('41b4e81c3c6c56e6171b746049a688a1')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  mkdir -p $pkgdir/usr/{s,}bin
  make PREFIX=$pkgdir/usr install
}