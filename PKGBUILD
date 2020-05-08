# Maintainer: soredake <fdsfgs@krutt.org>
pkgname=luxtorpeda
pkgver=20191003
pkgrel=2
pkgdesc='Steam Play compatibility tool to run games using native Linux engines'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$pkgname"
license=('GPL')
makedepends=('git' 'rust')
optdepends=( 'steam: The Steam client' )
source=("git+$url.git#commit=e770a4fe38577668b23ccbaadbcb54978fdd1026")
sha512sums=('SKIP')

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  make release
  make DESTDIR="$pkgdir" prefix=/usr install
}
