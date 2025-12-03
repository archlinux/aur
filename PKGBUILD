# Maintainer:   Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Alexej Magura <amagura28@gmail.com>
# Contributor:  ruantu <mtwget@gmail.com>

pkgname=libzlog
_name=zlog
pkgver=1.2.18
pkgrel=1
pkgdesc="a reliable pure C logging library"
arch=('i686' 'x86_64')
url="https://github.com/hardysimpson/zlog"
license=('Apache-2.0')
depends=('glibc')
provides=('libzlog.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3977dc8ea0069139816ec4025b320d9a7fc2035398775ea91429e83cb0d1ce4e')

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
