# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=gore
pkgver=0.5.3
pkgrel=1
license=('MIT')
pkgdesc="Yet another Go REPL that works nicely"
depends=('go')
arch=('x86_64')
url="https://github.com/motemen/gore"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/motemen/gore/archive/v${pkgver}.tar.gz")
sha256sums=('6df45dceff3767cb69c391711ba70d4183a8c6b0ed93866c4107b44310902c6d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
  install -D -m644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
