# Maintainer: Daniel Jenssen <daerandin@gmail.com>
pkgname=cebac
pkgver=0.1.3
pkgrel=1
pkgdesc="Cloud storage backup helper"
arch=('x86_64')
url="https://gitlab.com/Daerandin/cebac"
license=('GPL3')
depends=('glibc' 'libarchive' 'gpgme' 'python' 'python-boto3')
options=('strip')
source=(https://gitlab.com/Daerandin/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
validpgpkeys=('40EB5B887AF9E9AB68C06179CCDE95DE8A5C8CC6')
sha256sums=('6c35e898ebaae8b0976c23c64e7d60632aee03651edd0e2b37100be8d4672e53')

build() {
  cd "$pkgname-$pkgver/src"

  make
}

package() {
  cd "$pkgname-$pkgver/src"

  install -Dm755 cebac "$pkgdir/usr/bin/cebac"
  install -Dm644 ../config/example.conf "$pkgdir/usr/share/cebac/example.conf" 
}
