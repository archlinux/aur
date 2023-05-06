# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak (at) gmail [dot] com>

pkgname=xasm
pkgver=3.2.1
pkgrel=2
pkgdesc="6502 cross-assembler with original syntax extensions"
arch=('x86_64')
url="https://github.com/pfusik/xasm"
source=(
    https://github.com/pfusik/xasm/archive/xasm-$pkgver.zip
    )

sha256sums=(
    '3468bc239f9a54b3b3967ec021b90088ec0b92d279ff620703192dddd104c1f4'
    )
license=('Poetic')
provides=('xasm')
depends=('glibc' 'gcc-libs')
makedepends=('dmd' 'git' 'asciidoc')

build() {
  cd "$srcdir/${pkgname}-xasm-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-xasm-${pkgver}"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 xasm "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/doc/xasm"
  install -Dm644 xasm.1 "$pkgdir/usr/share/man/man1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/xasm"
}
