# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=lenovo-logo-changer
pkgver=0.2.0
pkgrel=1
pkgdesc="Personalize your Lenovo's UEFI boot logo with jpg/tga/pcx/gif/bmp/png"
arch=('x86_64')
url="https://github.com/chnzzh/lenovo-logo-changer"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/chnzzh/lenovo-logo-changer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e383bf2937faf4d4d6980682dac96368e8516b6f2f03d440dd7a578094ad675')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/target/release/lenovo-logo-changer" "$pkgdir/usr/bin/lenovo-logo-changer"
}
