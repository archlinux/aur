# Maintainer : Daniel Chesters <daniel.chesters@gmail.com>

pkgname=i3wsr
pkgver=2.1.1
pkgrel=1
pkgdesc="A small program to change the name of an i3 workspace based on its contents."
url="https://github.com/roosta/i3wsr"
depends=('i3-wm')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/roosta/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
b2sums=('594a1ac1e11d31eea01011574ed5cbdd56b16ae28e4d358cc86dbe11657c533b04d6b204e67c2110f25b536012fc2a6a10f754adb33d13e9edfe62d6c99d4180')
