# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

pkgname=scaphandre
pkgver=0.4.1
pkgrel=1
pkgdesc="Electrical power consumption metrology agent"
arch=('x86_64')
url="https://github.com/hubblo-org/scaphandre/"
license=(Apache)
depends=('gcc-libs' 'zlib' 'openssl')
makedepends=('rust')
source=($pkgname-$pkgver.tar.gz::https://github.com/hubblo-org/scaphandre/archive/v${pkgver}.tar.gz)
sha512sums=('c730842981b74d5f2edc7f44fe90047402181e7e7ab89828eb7a4775fb754301bd32078a11218a67c24b907f1ffe4beabd60d2687f218e4815bd9cdd7eab098c')

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
