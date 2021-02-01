# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=scaphandre
pkgver=0.1.1
pkgrel=1
pkgdesc="Electrical power consumption metrology agent"
arch=('x86_64')
url="https://github.com/hubblo-org/scaphandre/"
license=(Apache)
depends=('gcc-libs')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/hubblo-org/scaphandre/archive/v${pkgver}.tar.gz)
sha512sums=('882bb281f3c3ea8be60b26b7fdc5d24e0e0f5b0589a356d4e76b6e9505058bcb1a5bd8c2c89a0ddb3e914b076e7e0462bda1a4f7d7acc0239c01c4de2082c8be')

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
