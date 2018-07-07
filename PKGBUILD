# Maintainer: Philipp Mildenberger
pkgname=clang-format-all-git
_gitname=clang-format-all
pkgver=r8.4d6ee56
pkgrel=1
pkgdesc="clang format that recursively formats c/c++ files"
arch=('any')
url="https://github.com/eklitzke/clang-format-all"
license=('GPL3')
makedepends=('pacman' 'git')
depends=('clang')
conflicts=('clang-format-all' 'clang-format-all-git')
source=("git+https://github.com/eklitzke/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  install -m644 -Dt "$pkgdir/usr/share/licenses/$_gitname/" LICENSE.txt
  install -m644 -Dt "$pkgdir/usr/doc/$_gitname/" README.md
  install -m755 -Dt "$pkgdir/usr/bin/" clang-format-all
}
