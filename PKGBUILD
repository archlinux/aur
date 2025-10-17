# Maintainer: pastilhas <andre.padez@gmail.com>
pkgname=codeclip
pkgver=1.0.2
pkgrel=1
pkgdesc="A fast, minimal CLI tool to dump codebases or files into Markdown with clipboard integration"
arch=('x86_64')
url="https://github.com/andrepadez/codeclip"
license=('MIT')
depends=('glibc' 'coreutils')
makedepends=('make' 'gcc')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
