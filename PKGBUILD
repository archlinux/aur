# Maintainer: willow <willow@purring.fyi>

_pkgname=hare-sqlite
pkgname=hare-sqlite-git
pkgver=r28.0d92339
pkgrel=1
pkgdesc='SQLite support for Hare'
arch=('any')
url="https://git.sr.ht/~blainsmith/${_pkgname}"
license=('MIT')
depends=('hare' 'hare-sql' 'sqlite')
makedepends=('git')
provides=('hare-sqlite')
conflicts=('hare-sqlite')
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
