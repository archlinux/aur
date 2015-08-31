# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate
pkgver=r58.e8894c4
pkgrel=1
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('any')
url="https://github.com/ioi/isolate"
license=('GPL2')
depends=(
  'libcgroup'
)
makedepends=(
  'git'
  'gcc'
  'asciidoc'
)
provides=('isolate')

source=(
  'git://github.com/ioi/isolate.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $pkgname/isolate $pkgdir/usr/bin/isolate
}
