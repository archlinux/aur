# Maintainer: toxdes <hi@toxdes.com>
pkgname=quectop
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Linux resource monitor"
arch=('x86_64' 'aarch64')
url='https://github.com/toxdes/quectop'
license=('MIT')
makedepends=('git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/quectop"
  make quectop
}

package() {
  cd "$srcdir/quectop"
  install -Dm755 quectop "$pkgdir/usr/bin/quectop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
