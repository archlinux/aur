# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=lazynmap
pkgver=0.1.3
pkgrel=1
pkgdesc="Build complex nmap commands with an intuitive TUI"
arch=('x86_64')
url="https://github.com/ruiiiijiiiiang/lazynmap"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
depends=('glibc')
makedepends=('cargo' 'rust')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ruiiiijiiiiang/lazynmap/archive/v$pkgver.tar.gz")
sha256sums=('c73ffa2da43f88ef86cddd6d4bafd8fc6d89e0702263a1e35f7d90a02eb99858')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
