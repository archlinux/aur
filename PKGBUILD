# Maintainer: Pierce Thompson <pierce at insprill dot net>

_pkgname=i3lock-fancy-rapid
pkgname=$_pkgname-git
pkgver=r19.6eeebd4
pkgrel=2
pkgdesc="A faster implementation of i3lock-fancy"
arch=('x86_64')
url="https://github.com/yvbbrjdr/$_pkgname"
license=('BSD-3-Clause')
depends=('i3lock' 'libx11')
makedepends=('git')
optdepends=('i3lock: Locking support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

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
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
