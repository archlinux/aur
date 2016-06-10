# Maintainer: Sam S <smls75@gmail.com>
# Contributor: Testuser_01 <arch@nico-siebler.de>

pkgname=lscolors-git
pkgver=r220.4d5aeed
pkgrel=1
pkgdesc="Colorize the output of the 'ls' shell command via LS_COLORS"
url="https://github.com/trapd00r/LS_COLORS"
arch=('any')
license=('PerlArtistic')
install="$pkgname.install"

_repo=LS_COLORS
source=("git://github.com/trapd00r/$_repo.git")
md5sums=("SKIP")

pkgver() {
  cd $_repo
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_repo
  install -D LS_COLORS       "$pkgdir"/usr/share/LS_COLORS
  install -D README.markdown "$pkgdir"/usr/share/doc/LS_COLOR/README.md
}
