# Maintainer: ararouge <ararouge at protonmail dot ch>

pkgname="bootique-git"
pkgver="r23.f6bb"
pkgrel=1
pkgdesc="A templated theming system built in POSIX sh"
arch=("any")
url="https://github.com/BanchouBoo/bootique"
license=("MIT")
makedepends=("git")
provides=("bootique")
conflicts=("bootique")
source=("git+https://github.com/BanchouBoo/bootique.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/bootique"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse 4 --short HEAD)"
}

package() {
  cd "$srcdir/bootique"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/bootique-git/LICENSE"
  install -D -m755 bootique "$pkgdir/usr/bin/bootique"
}
