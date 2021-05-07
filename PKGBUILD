# Maintainer: Joop Kiefte <ikojba@gmail.com>

pkgname=e
pkgver=0.1.1
pkgrel=2
pkgdesc="A modern line editor with JavaScript capabilities"
arch=('x86_64' 'i686')
url="https://github.com/LaPingvino/$pkgname"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/LaPingvino/$pkgname/archive/v$pkgver.zip")
sha256sums=('79535fbc74f2a4377da46edba2ea2dd81f671478e3c1136f2abbf1a6450bc176')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
