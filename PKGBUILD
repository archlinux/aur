# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname=elfio
pkgver=3.1
pkgrel=1
pkgdesc="ELFIO is a small, header-only C++ library that provides a simple interface for reading and generating files in ELF binary format"
arch=('i686' 'x86_64')
url="http://elfio.sourceforge.net/"
license=('MIT License')
depends=('glibc')
makedepends=()
options=('strip')
source=("http://sourceforge.net/projects/elfio/files/ELFIO-sources/ELFIO-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('938b62673b23bb858ecfd388a328f52c')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
