# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=gore
pkgver=0.5.3
pkgrel=2
license=('MIT')
pkgdesc="Yet another Go REPL that works nicely"
depends=('go')
arch=('x86_64')
url="https://github.com/motemen/gore"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/motemen/gore/archive/v${pkgver}.tar.gz")
sha256sums=('7b97773932526378a409fbdd04f86f174989fa8eccf3dc80fe4e387c51b5442a')

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
