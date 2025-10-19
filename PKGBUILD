# Maintainer: Your Name <youremail@example.com>
pkgname=emopick-git
pkgver=r2.9381a2f
pkgrel=1
pkgdesc="A tiny, emoji picker for the terminal (git dev version)"
arch=('any')
url="https://gitlab.com/greyxor/emopick"
license=('MIT')
depends=('awk' 'fzf' 'unicode-emoji')
makedepends=('git')
source=("${pkgname}::git+https://gitlab.com/greyxor/emopick.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/emopick-git"

  install -Dm755 emopick.sh "$pkgdir/usr/bin/emopick"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
