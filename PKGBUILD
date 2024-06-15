# Maintainer: tarball <bootctl@gmail.com>

pkgname=keydogger
pkgver=1.0
pkgrel=1
pkgdesc='Zero dependency keyboard macro processor'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/jarusll/keydogger'
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c67c49a04b748a9fbcf90785e733eacb2356371ccbdd2504a65071a077d72446a8af44ee636f415a39b5c09834110186bc2b6907e08cf6bed29c39460289e331')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 keydogger -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 keydoggerrc -t "$pkgdir/usr/share/doc/$pkgname/"
}
