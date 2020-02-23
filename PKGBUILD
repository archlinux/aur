# Maintainer: Alvin Rhaman <ararouge {at} protonmail {dot} ch>
pkgname=bootique-git
_pkgname=bootique
pkgver=r11.244d11f
pkgrel=2
pkgdesc="A templated theming system built in POSIX sh."
arch=("any")
url="https://github.com/BanchouBoo/${_pkgname}"
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=("git")
source=("git+https://github.com/BanchouBoo/bootique.git")
md5sums=("SKIP")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/bootique-git/LICENSE"
  install -D -m755 bootique "$pkgdir/usr/bin/$_pkgname"
}
