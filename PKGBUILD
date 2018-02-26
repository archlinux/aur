# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=compsize
pkgver=1.1
pkgrel=1
pkgdesc="Calculate compression ratio of a set of files on Btrfs"
arch=(i686 x86_64)
url="https://github.com/kilobyte/compsize"
license=(GPL)
depends=(glibc)
makedepends=(btrfs-progs git)
_commit=4d1a278d8b90f439f3e5dadfe02e7d8c566eecc5  # tags/v1.1^0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/share/man/man8"
  make install PREFIX="$pkgdir"
}
