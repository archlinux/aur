# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=shmenu-git
pkgver=r47.b6a494f
pkgrel=1
pkgdesc="Dynamic menu for the terminal written in pure bash"
arch=('any')
url="https://github.com/Crestwave/shmenu"
license=('MIT')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/shmenu"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/shmenu"
  install -Dm755 -t "$pkgdir/usr/bin" shmenu
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
