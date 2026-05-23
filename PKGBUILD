# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=file_clipper
pkgver=0.1.5
_binname=clp
pkgrel=1
pkgdesc="Command line utility for copying/moving files"
arch=('x86_64')
url="https://github.com/ruiiiijiiiiang/file_clipper"
license=('MIT')
provides=("$_binname")
conflicts=("$_binname")
depends=('glibc')
makedepends=('cargo' 'rust')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ruiiiijiiiiang/file_clipper/archive/v$pkgver.tar.gz")
sha256sums=('0c95290fda94fac33c3d17c6a000a79aa28dad25b45acd50d2f4dc97e036ce77')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
