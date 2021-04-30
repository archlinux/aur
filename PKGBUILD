# Maintainer: Alban Fichet <alban.fichet@inria.fr>
pkgname=openexr-thumbnailer
pkgver=1.0
pkgrel=2
pkgdesc="Tool to display thumbnails for OpenEXR images in your file manager."
arch=('any')
url="https://github.com/yama-chan/openexr-thumbnailer"
license=('GPL')
depends=('gnome-common' 'glib2' 'gdk-pixbuf2' 'openexr')
makedepends=('cmake' 'git')
checkdepends=()
provides=($pkgname=$pkgver)
source=("$pkgname::git+https://github.com/yama-chan/$pkgname.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	git checkout v$pkgver
}

build() {
	cd "$pkgname"
	cmake . -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
	make
}

package() {
	cd "$pkgname"
	make install
}
