# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=compsize
pkgver=1.2
pkgrel=1
pkgdesc="Calculate compression ratio of a set of files on Btrfs"
arch=(i686 x86_64)
url="https://github.com/kilobyte/compsize"
license=(GPL)
depends=(glibc)
makedepends=(btrfs-progs git)
_commit=7b91a8be5d0b883de5921be61f76e064af339a07  # tags/v1.2^0
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
