# Maintainer: Daniel Jenssen <daerandin@gmail.com>
pkgname=cebac
pkgver=1.1
pkgrel=2
pkgdesc="Cloud storage backup helper"
arch=('x86_64')
url="https://gitlab.com/Daerandin/cebac"
license=('GPL3')
depends=('libarchive' 'gpgme' 'python')
optdepends=('python-boto3' 'python-dropbox')
options=('strip')
source=(https://gitlab.com/Daerandin/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
validpgpkeys=('40EB5B887AF9E9AB68C06179CCDE95DE8A5C8CC6')
sha256sums=('f47cdfcef3dd879e5dba7ebf5dbe3fcb2143fb12145aafdae63ae7c3a77d6aa7')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make

}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
