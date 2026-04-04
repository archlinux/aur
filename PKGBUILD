# Maintainer: John Doe <john@example.com>
pkgname=udu
pkgver=0.6.91
pkgrel=1
pkgdesc="Extremely fast command-line disk usage analyzer"
arch=('x86_64' 'aarch64')
url="https://github.com/gnualmalki/udu"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/udu@$pkgver.tar.gz")
sha256sums=('7035f9fb518b2cb2ab4d9b5ba3e56c1a75cda1b98e07a2fbb66c9935d61d57e6')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  install -Dm755 udu "$pkgdir/usr/bin/udu"
  install -Dm644 udu.1 "$pkgdir/usr/share/man/man1/udu.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
