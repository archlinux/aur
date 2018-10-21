# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=fff-git
pkgver=r74.b6a240a
pkgrel=1
pkgdesc="A simple file manager written in bash"
arch=('any')
url="https://github.com/dylanaraps/fff"
license=('MIT')
makedepends=('git')
depends=('bash' 'xdg-utils')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fff"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/fff"
  install -Dm755 fff "${pkgdir}/usr/bin/fff"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
