# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=fff-git
pkgver=r520.826e16f
pkgrel=1
pkgdesc="A simple file manager written in bash"
arch=('any')
url="https://github.com/dylanaraps/fff"
license=('MIT')
depends=('xdg-utils')
makedepends=('git')
optdepends=(
  'w3m: Image display support'
  'xdotool: Image display support for X'
  'fbset: Image display support for the framebuffer'
)
provides=('fff')
conflicts=('fff')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fff"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/fff"
  install -Dm755 fff "$pkgdir/usr/bin/fff"
  install -Dm644 fff.1 "$pkgdir/usr/share/man/man1/fff.1"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
