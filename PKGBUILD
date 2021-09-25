# Maintainer: N Fytilis <n-fit AT live.com>
_pkgbase=ntfs2btrfs
pkgname=$_pkgbase-git
pkgbase=$_pkgbase-git
pkgver=1
pkgrel=2
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
	cd "$_pkgbase"
  mkdir b || true
  cd b
	cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd "$_pkgbase/b"
	make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
}
