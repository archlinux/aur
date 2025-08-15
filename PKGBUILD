# Maintainer: NEOAPPS <asd22.info@gmail.com>
pkgname=architect-git
pkgver=r21.adb41a1
pkgrel=1
pkgdesc="Nix-like configuration manager for pacman"
arch=('any')
url="https://github.com/neoapps-dev/Architect"
license=('GPL-3.0')
depends=('bash')
makedepends=('git' 'make')
provides=('architect')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 architect "$pkgdir/usr/bin/architect"
}
