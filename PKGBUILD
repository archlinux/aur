pkgname='dlauncher'
pkgver=0.1.1
pkgrel=1
makedepends=('rust' 'cargo')
conflicts=('dlauncher' 'dlauncher-bin')
provides=('dlauncher')
arch=('x86_64')
pkgdesc="An application launcher for Linux that is based on Ulauncher"
url="https://github.com/diced/dlauncher"
source=("$url/releases/download/v$pkgver/dlauncher" "$url/releases/download/v$pkgver/dlauncher-toggle")
sha256sums=('bb030a62642afbf11dc1b68a85d11ebd986f7418dae53ee346874c5927c1ba0a' '205441344af36652562e5d9664b5358779046eb843321f4a306e702432fd1ed5')
license=('GPL3')

package() {
  cd "$srcdir" || exit 1

  install -D -o root -g root -m 755 dlauncher "$pkgdir/usr/bin/dlauncher"
  install -D -o root -g root -m 755 dlauncher-toggle "$pkgdir/usr/bin/dlauncher-toggle"
}