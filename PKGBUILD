# Maintainer:   Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Alexej Magura <amagura28@gmail.com>
# Contributor:  ruantu <mtwget@gmail.com>

pkgname=libzlog
_name=zlog
pkgver=1.2.20
pkgrel=1
pkgdesc="A reliable pure C logging library"
arch=('i686' 'x86_64')
url="https://github.com/hardysimpson/zlog"
license=('Apache-2.0')
depends=('glibc')
provides=('libzlog.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('432723ccd9a5b07ec1e4b8cc985d9011d768633b1e4c4facfc0e3e9a7ad5fcf7')

build() {
  cd "$_name-$pkgver"
  make all
}

check() {
  cd "$_name-$pkgver"
  make test
}

package() {
  cd "$_name-$pkgver"
  make PREFIX="$pkgdir/usr" install

  install -d "$pkgdir/usr/share/$pkgname/doc"
  install -t "$pkgdir/usr/share/$pkgname/doc" doc/*.txt
  install -t "$pkgdir/usr/share/$pkgname/doc" doc/*.conf
}

# vim:set ts=2 sw=2 et:
