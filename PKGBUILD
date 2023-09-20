# Maintainer: Yassine Oudjana <y.oudjana@protonmail.com>

pkgname=gl3n
pkgver=1.4.1
pkgrel=1
pkgdesc="OpenGL Maths for D (not glm for D)."
arch=(any)
url="https://github.com/Dav1dde/gl3n"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37c626e4859baf751538264904d3b0500e548b74bc302518fe095ce06db4f8e6')

build() {
	cd $pkgname-$pkgver

	make PREFIX=/usr
}

package() {
	cd $pkgname-$pkgver

	make -j $(nproc) PREFIX=$pkgdir/usr install
}

