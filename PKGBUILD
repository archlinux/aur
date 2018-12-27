# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=ufetch-git
_pkgname=ufetch
pkgver=r113.4df8cf8
pkgrel=1
epoch=1
pkgdesc="Info script for minimal *nix systems."
arch=('any')
url="https://gitlab.com/jschx/${_pkgname}"
license=('ISC')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=("git+https://gitlab.com/jschx/ufetch.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/ufetch-git/LICENSE"
  install -D -m755 ufetch-arch "$pkgdir/usr/bin/$_pkgname"
}

