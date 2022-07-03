pkgname='dlauncher-git'
pkgver=0.1.2
pkgrel=1
makedepends=('rust' 'cargo')
conflicts=('dlauncher' 'dlauncher-bin')
provides=('dlauncher')
arch=('x86_64')
pkgdesc="An application launcher for Linux that is based on Ulauncher"
url="https://github.com/diced/dlauncher"
source=('git+https://github.com/diced/dlauncher.git#branch=trunk')
sha256sums=('SKIP')
license=('GPL3')


build() {
  cd "$srcdir/dlauncher" || exit 1
  make build
}

package() {
  cd "$srcdir/dlauncher" || exit 1

  install -D -o root -g root -m 755 target/release/dlauncher "$pkgdir/usr/bin/dlauncher"
  install -D -o root -g root -m 755 target/release/dlauncher-toggle "$pkgdir/usr/bin/dlauncher-toggle"
  install -D -o root -g root -m 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}