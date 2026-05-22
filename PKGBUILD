# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=lazynmap
pkgver=0.1.2
pkgrel=2
pkgdesc="Build complex nmap commands with an intuitive TUI"
arch=('x86_64')
url="https://github.com/ruiiiijiiiiang/lazynmap"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('glibc')
makedepends=('cargo' 'rust')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ruiiiijiiiiang/lazynmap/archive/v$pkgver.tar.gz")
sha256sums=('175fd24d4aaa9f68eb4c7a964e5a1e5cb3504a80d14dd4e7ee3d899c01137c3c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
