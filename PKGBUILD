# Maintainer: bb010g <bb010g@gmail.com>
pkgname=betterdiscordctl-git
pkgver=r3.be6d4c1
pkgrel=1
pkgdesc="A utility for managing BetterDiscord on Linux"
arch=('any')
url="https://github.com/bb010g/betterdiscordctl"
license=('MIT')
depends=('asar' 'git' 'nodejs' 'npm')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/bb010g/betterdiscordctl.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 betterdiscordctl "$pkgdir/usr/bin/betterdiscordctl"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
