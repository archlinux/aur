# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=lazynmap
pkgver=0.1.1
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
sha256sums=('78638f6e876f461082d5735f4b4ef2cfbac0cf4649aa37270ef2e1abd81d4cbd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
