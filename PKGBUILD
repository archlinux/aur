# Maintainer: Ukang'a <ukanga@users.noreply.github.com>
pkgname=sre-tooling-git
pkgver=0.7.1.04b628cd
pkgrel=1
pkgdesc="A set of useful SRE tools."
arch=('x86_64')
url="https://github.com/onaio/sre-tooling"
license=('Apache License 2.0')
depends=(
  'sudo'
  'git'
)
makedepends=(
  'go'
)
source=("git://github.com/onaio/sre-tooling.git")
sha1sums=('SKIP')

build() {
  export GOPATH="$srcdir"/gopath
  echo $GOPATH
  cd "$srcdir/sre-tooling"
  EXTRA_GOFLAGS="-modcacherw" make VERSION=$pkgver DESTDIR="$pkgdir" build
}

package() {
  cd "$srcdir/sre-tooling"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
