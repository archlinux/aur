# Maintainer: Timo Bingmann <tbaur@panthema.net>

pkgname=disk-filltest
pkgver=0.8.2
pkgrel=1
pkgdesc="Simple tool to detect bad disks by filling with random data"
arch=('i686' 'x86_64')
url="https://panthema.net/2013/disk-filltest/"
license=('GPL')
source=(https://panthema.net/2013/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('01821446446d669749cd07eae14e13b1')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" prefix="/usr" man1dir="/usr/share/man" install
}
