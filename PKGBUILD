# Mantainer: Alberto Santini <alberto dot santini at upf dot edu>

pkgname='palns-git'
pkgdesc='Header-only C++ library for the Parallel Adaptive Neighbourhood Search metaheuristic.'

pkgver=r10.751c36f
pkgrel=2

arch=('x86_64')
url='https://github.com/alberto-santini/adaptive-large-neighbourhood-search'
license=('GPL3')
depends=()
optdepends=()
ckeckdepends=()
source=("git+https://github.com/alberto-santini/adaptive-large-neighbourhood-search.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/adaptive-large-neighbourhood-search"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -dm755 "$pkgdir/usr/include/palns/AcceptanceCriteria"
  install -m644 "$srcdir/adaptive-large-neighbourhood-search/src/"*.h "$pkgdir/usr/include/palns"
  install -m644 "$srcdir/adaptive-large-neighbourhood-search/src/AcceptanceCriteria/"*.h "$pkgdir/usr/include/palns/AcceptanceCriteria"
}
