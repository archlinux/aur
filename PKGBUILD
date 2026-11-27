# Maintainer: toxdes <hi@toxdes.com>
pkgname=quectop-hub
pkgver=0.1.0
pkgrel=1
pkgdesc="Dashboard and data collector for quectop probes"
arch=('x86_64' 'aarch64')
url='https://github.com/toxdes/quectop'
license=('MIT')
depends=('quectop')
makedepends=('git' 'bun' 'python')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/quectop"
  make quectop-hub
}

package() {
  cd "$srcdir/quectop"
  install -Dm755 quectop-hub "$pkgdir/usr/bin/quectop-hub"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 web/icons/LICENSE "$pkgdir/usr/share/licenses/$pkgname/tabler-icons.LICENSE"
}
