# Maintainer: Crestwave <crest.wave@yahoo.com>

pkgname=brainbash-git
pkgver=r32.af033c8
pkgrel=1
pkgdesc="A brainfuck interpreter written in pure Bash"
arch=('any')
url="https://github.com/Crestwave/brainbash"
license=('MIT')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/brainbash"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/brainbash"
  install -Dm755 -t "$pkgdir/usr/bin" brainbash
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
