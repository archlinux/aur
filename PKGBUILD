# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=faint-git
pkgdesc="Extensible TUI fuzzy file explorer (git)"
pkgver=0.97.r0.gadfb5a3
pkgrel=1
arch=('x86_64')
url="https://github.com/salman-abedin/faint"
license=('unknown')
depends=('fzf')
makedepends=('make' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  make BIN_DIR="$pkgdir/usr/bin" install
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
