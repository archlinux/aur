# Maintainer: tarball <bootctl@gmail.com>

pkgname=keydogger
pkgver=2.0
pkgrel=1
pkgdesc='Zero dependency keyboard macro processor'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/jarusll/keydogger'
license=('MIT')
depends=('glibc' 'wl-clipboard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5e19719c9115ffdfe72d23bef6c9905d18481347219b4f3cbd5e6356d137c276893e0d474498f9af166f0f8fe4e947f31482991c0e9f9f027e96c02af9ce4357')

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
