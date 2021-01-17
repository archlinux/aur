# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=speedread-git
pkgver=r38.93acfd6
pkgrel=1
pkgdesc="A simple terminal-based open source Spritz-alike"
arch=(any)
url=https://github.com/pasky/speedread
license=(MIT)
depends=(perl)
makedepends=(git)
provides=(speedread)
conflicts=(speedread)
source=(git+https://github.com/pasky/speedread.git)
md5sums=('SKIP')

pkgver() {
  cd speedread
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd speedread
  install -Dm0755 speedread "$pkgdir/usr/bin/speedread"
  install -Dm0644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
