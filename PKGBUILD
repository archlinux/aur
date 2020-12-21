# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ntfs2btrfs
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
	cd "$pkgname"
  mkdir b || true
  cd b
	cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd "$pkgname/b"
	make DESTDIR="$pkgdir/" install
}
