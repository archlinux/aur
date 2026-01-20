# Maintainer: Reyzer <reyzervt@gmail.com>
pkgname=nfx
pkgver=1.0.2
pkgrel=1
pkgdesc="NFX archive tool written in C using Zstandard"
arch=('x86_64')
url='https://github.com/ReyzerMC/nfx'
license=('MIT')
depends=('zstd')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 nfx "$pkgdir/usr/bin/nfx"
  install -Dm644 README.md "$pkgdir/usr/share/doc/nfx/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/license/nfx/LICENSE"
}
