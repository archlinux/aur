# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=metastore-git
_gitname=metastore
pkgver=r122.41861e7
pkgrel=1
pkgdesc="Store and restore metadata from a filesystem."
arch=(i686 x86_64)
url="http://david.hardeman.nu/software.php#metastore"
license=(GPL)
provides=(metastore)
conflicts=(metastore)
depends=(libbsd)
makedepends=(git)
source=(git+https://github.com/przemoc/metastore)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    # No tagged commits. ヽ(´ー｀)ノ
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

build() {
  cd "$_gitname"
  make
}

package() {
  cd "$_gitname"
  make PREFIX="$pkgdir"/usr install
}

