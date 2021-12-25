# Maintainer: Daniel Jenssen <daerandin@gmail.com>
pkgname=cebac
pkgver=0.3.1
pkgrel=1
pkgdesc="Cloud storage backup helper"
arch=('x86_64')
url="https://gitlab.com/Daerandin/cebac"
license=('GPL3')
depends=('glibc' 'libarchive' 'gpgme' 'python' 'python-boto3')
options=('strip')
source=(https://gitlab.com/Daerandin/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
validpgpkeys=('40EB5B887AF9E9AB68C06179CCDE95DE8A5C8CC6')
sha256sums=('1fb4d9faec9d17b86aa0979d982f40f905995d389192492c75e9951c256b8f96')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make

}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
