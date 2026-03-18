# Maintainer: qt-ami3
pkgname=2048shell
pkgver=1.3.22
pkgrel=1
pkgdesc="2048 game playable in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/qt-ami3/2048Shell"
license=('GPL-3.0-only')
depends=()
makedepends=('gcc' 'make')
source=("$pkgname::git+https://github.com/qt-ami3/2048Shell.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 build/2048shell "$pkgdir/usr/bin/2048shell"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
