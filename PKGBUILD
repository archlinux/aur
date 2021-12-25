# Maintainer: Daniel Jenssen <daerandin@gmail.com>
pkgname=cebac
pkgver=0.3
pkgrel=1
pkgdesc="Cloud storage backup helper"
arch=('x86_64')
url="https://gitlab.com/Daerandin/cebac"
license=('GPL3')
depends=('glibc' 'libarchive' 'gpgme' 'python' 'python-boto3')
options=('strip')
source=(https://gitlab.com/Daerandin/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
validpgpkeys=('40EB5B887AF9E9AB68C06179CCDE95DE8A5C8CC6')
sha256sums=('4774832350a7568e3920cb1b9e5cf9bad67221e25d5b1974e28633d280b04af9')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make

}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
