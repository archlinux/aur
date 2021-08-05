# Maintainer: Daniel Jenssen <daerandin@gmail.com>
pkgname=cebac
pkgver=0.1
pkgrel=1
pkgdesc="Cloud storage backup helper"
arch=('x86_64')
url="https://gitlab.com/Daerandin/cebac"
license=('GPL3')
depends=('glibc' 'libarchive' 'gpgme' 'python' 'python-boto3')
options=('strip')
source=(https://gitlab.com/Daerandin/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
validpgpkeys=('40EB5B887AF9E9AB68C06179CCDE95DE8A5C8CC6')
sha256sums=('9483847214b7bb420febf484627fd2dda87aefbf5ce8d77749a0c99101c694b0')

build() {
  cd "$pkgname-$pkgver/src"

  make
}

package() {
  cd "$pkgname-$pkgver/src"

  install -Dm755 cebac "$pkgdir/usr/bin/cebac"
  install -Dm644 ../config/example.conf "$pkgdir/usr/share/cebac/example.conf" 
}
