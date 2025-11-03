# Maintainer: mango <mango@archlinux.org>
pkgname=simreader
pkgver=1.0.0
pkgrel=1
pkgdesc="Unified SIM/USIM card reader tool with complete analysis capabilities"
arch=('x86_64')
url="https://github.com/mango/simreader"
license=('MIT')
depends=('pcsclite')
makedepends=('gcc')
source=("git+https://github.com/mango/simreader.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  gcc -o simreader src/simreader.c -lpcsclite -I/usr/include/PCSC
}

package() {
  cd "$pkgname"
  install -Dm755 simreader "$pkgdir/usr/bin/simreader"
  install -Dm644 man/simreader.1 "$pkgdir/usr/share/man/man1/simreader.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}