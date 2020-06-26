# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=fzmp-git
_pkgname=fzmp
pkgver=r140.ec9569c
pkgrel=1
pkgdesc="Info script for minimal *nix systems."
arch=('any')
url="https://github.com/DanielFGray/fzf-scripts"
license=('GPL3')
provides=($_pkgname)
depends=('mpd' 'mpc' 'fzf')
makedepends=('git')
source=("git+https://github.com/DanielFGray/fzf-scripts.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fzf-scripts"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/fzf-scripts"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 fzmp "$pkgdir/usr/bin/fzmp"
}

