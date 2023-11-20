# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_pkgname=community-configs-for-protopedal
pkgname=community-configs-for-protopedal-git
provides=$_pkgname
pkgver=0.1
pkgrel=1
pkgdesc="Community-sourced configurations for protopedal."
arch=('any')
url="https://github.com/Lawstorant/community-configs-for-protopedal"
license=('GPL3')
depends=(
  bash
  joyutils
  protopedal-git
)
makedepends=(
  git
  make
  sed
)
source=(
  git+https://github.com/Lawstorant/community-configs-for-protopedal
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make all
}

package() {
  cd "$srcdir/$_pkgname"
  make install
}
