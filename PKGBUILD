# Maintainer: Redson dos Santos Silva <redsonbr81 {at} protonmail {dot} com>
# Maintainer: Pedro Portales <pedro.portales {at} protonmail {dot} com>
pkgname=ppfetch-git
_pkgname=ppfetch
pkgver=1.09.8fd1ae9
pkgrel=1
pkgdesc="Info script written in BASH, alternative for ufetch and neofetch."
arch=('any')
url="https://gitlab.com/pedro.portales/${_pkgname}"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=("git+https://gitlab.com/pedro.portales/ppfetch.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "1.0%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/ppfetch-git/LICENSE"
  install -D -m755 ppfetch "$pkgdir/usr/bin/$_pkgname"
}
