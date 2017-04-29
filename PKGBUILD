# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=watchexec
pkgver=1.8.3
pkgrel=1
pkgdesc="Executes commands in response to file modifications"
url='https://github.com/mattgreen/watchexec'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e447292f68fe24e1e7b10b0b1c841b2644ad97598cfda037d65756b8e1801c1e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
