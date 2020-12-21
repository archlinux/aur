# Maintainer: N Fytilis <n-fit AT live.com>
pkgbase=ntfs2btrfs
pkgname=$pkgbase-git
pkgver=1
pkgrel=1
epoch=
pkgdesc="Convertion from ntfs to btrfs keeping NT metadata"
arch=(any)
url=""
license=('GPL')
depends=(fmt)
makedepends=(cmake gcc)
source=("git+https://github.com/maharmstone/ntfs2btrfs")
md5sums=(SKIP)

build() {
	cd "$pkgbase"
  mkdir b || true
  cd b
	cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd "$pkgbase/b"
	make DESTDIR="$pkgdir/" install
}
