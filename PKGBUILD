# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=scaphandre
pkgver=0.5.0
pkgrel=1
pkgdesc="Electrical power consumption metrology agent"
arch=('x86_64')
url="https://github.com/hubblo-org/scaphandre/"
license=(Apache)
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/hubblo-org/scaphandre/archive/v${pkgver}.tar.gz)
sha512sums=('d6ad365a07d2270f47ee37e05e618c12d8ea66c1f1d8c2e9cab59a5b1790ec44af031729a0fe3c59f8fa5087b457dffe78681d70bc61a9228ff562e6c01af2a9')

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
