# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld-git
pkgver=r32.gabe5fe5
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/utils/stalld/stalld.git/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('stalld')
conflicts=('stalld')
source=("git+https://git.kernel.org/pub/scm/utils/stalld/stalld.git")
sha256sums=('SKIP')


pkgver() {
  cd "stalld"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "stalld"

  make
}

package() {
  cd "stalld"

  make DESTDIR="$pkgdir" install
}
