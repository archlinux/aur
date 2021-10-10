# Maintainer: Pedro Portales <pedro.portales {at} protonmail {dot} com>
# Maintainer: Redson dos Santos Silva <redsonbr81 {at} protonmail {dot} com>
pkgname=ppfetch-git
_pkgname=ppfetch
pkgver=1.03.4415dd7
pkgrel=1
pkgdesc="Info script written in BASH, alternative for ufetch and neofetch."
arch=('any')
url="https://github.com/pedroportales/${_pkgname}"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=("git+https://github.com/pedroportales/ppfetch.git")
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
