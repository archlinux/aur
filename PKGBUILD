# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=scaphandre
pkgver=0.4.0
pkgrel=1
pkgdesc="Electrical power consumption metrology agent"
arch=('x86_64')
url="https://github.com/hubblo-org/scaphandre/"
license=(Apache)
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/hubblo-org/scaphandre/archive/v${pkgver}.tar.gz)
sha512sums=('90a4b44f40c189016a532eee29227b9c4527905269c959aacec9dacea386ad6feca79ed5bbfa06cd318bbc75fa83b9ec0a7eb2a2f10c778509671a03cb0e4aa0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/scaphandre "$pkgdir"/usr/bin/scaphandre
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}

# vim:set ts=2 sw=2 et:
