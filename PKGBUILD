# Maintainer: Daniel Jenssen <daerandin@gmail.com>
pkgname=cebac
pkgver=0.2
pkgrel=1
pkgdesc="Cloud storage backup helper"
arch=('x86_64')
url="https://gitlab.com/Daerandin/cebac"
license=('GPL3')
depends=('glibc' 'libarchive' 'gpgme' 'python' 'python-boto3')
options=('strip')
source=(https://gitlab.com/Daerandin/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
validpgpkeys=('40EB5B887AF9E9AB68C06179CCDE95DE8A5C8CC6')
sha256sums=('f85f1300b634914a792568dd061122a1d0919f092da6a0930f20dc377577e296')

build() {
  cd "$pkgname-$pkgver/src"

  make
}

package() {
  cd "$pkgname-$pkgver/src"

  install -Dm755 cebac "$pkgdir/usr/bin/cebac"
  install -Dm644 ../config/example.conf "$pkgdir/usr/share/cebac/example.conf" 
}
