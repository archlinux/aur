# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=metastore-git
_gitname=metastore
pkgver=v1.1.0.r4.g0350d47
pkgrel=1
pkgdesc="Store and restore metadata from a filesystem."
arch=(i686 x86_64)
url="https://github.com/przemoc/metastore"
license=(GPL)
provides=(metastore)
conflicts=(metastore)
depends=(libbsd)
makedepends=(git)
source=(git+https://github.com/przemoc/metastore)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --long --tags \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  make PREFIX="$pkgdir"/usr install
}

