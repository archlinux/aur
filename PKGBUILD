# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=gore
pkgver=0.5.4
pkgrel=1
license=('MIT')
pkgdesc="Yet another Go REPL that works nicely"
depends=('go')
arch=('x86_64')
url="https://github.com/motemen/gore"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/motemen/gore/archive/v${pkgver}.tar.gz")
sha256sums=('6c134e6f0d23b524b2a08bbdc74a44b4d7cb9401b62c752fbc6d7a77d4e2cc54')

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
