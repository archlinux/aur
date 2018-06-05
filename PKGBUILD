# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=ufetch-git
_pkgname=ufetch
pkgver=r72.8dfc9a9
pkgrel=1
pkgdesc="Info script for minimal *nix systems."
arch=('any')
url="https://github.com/jschx/${_pkgname}"
license=('GPL')
provides=($_pkgname)
makedepends=('git')
source=("$_pkgname::git+https://github.com/jschx/ufetch.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"  
  install -D -m755 ufetch-arch "$pkgdir/usr/bin/$_pkgname"
}
