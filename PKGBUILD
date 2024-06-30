# Maintainer: tarball <bootctl@gmail.com>

pkgname=keydogger
pkgver=2.2
pkgrel=1
pkgdesc='Zero dependency keyboard macro processor'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/jarusll/keydogger'
license=('MIT')
depends=('glibc' 'wl-clipboard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6fa75925587cee71338a1c8b8f4b7589d4300d92d41b1eb90f42b9ef40b3465eff52da56b04216877bfcb4d6bf91b07d22a589c9aa01f1da53680afd04aac1fe')

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
