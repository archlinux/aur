# Maintainer: Oleh Prypin <aur@blaxpirit.com>
pkgname=crystal-icr
pkgver=0.2.7
pkgrel=1
pkgdesc="Interactive console for Crystal programming language"
arch=('i686' 'x86_64')
url='https://github.com/greyblake/crystal-icr'
license=('LGPL')
depends=('crystal' 'readline')
source=("https://github.com/greyblake/crystal-icr/archive/v$pkgver.tar.gz")
sha256sums=('1a1e32e95da650264f748eb65f9f63e7a94eb39c3794ab3b031e5c4826ee1068')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/icr "$pkgdir/usr/bin/icr"
}
