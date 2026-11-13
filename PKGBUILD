# Maintainer: willow <willow@purring.fyi>

_pkgname=hare-sql
pkgname=hare-sql-git
pkgver=r4.aece218
pkgrel=1
pkgdesc='High-level SQL interface for Hare'
arch=('any')
url="https://git.sr.ht/~blainsmith/${_pkgname}"
license=('MIT')
depends=('hare')
makedepends=('git')
provides=('hare-sql')
conflicts=('hare-sql')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd $_pkgname

  make check
}

package() {
  cd $_pkgname

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
