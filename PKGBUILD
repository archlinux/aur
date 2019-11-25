# Maintainer: Alban Fichet <alban.fichet@inria.fr>
pkgname=openexr-thumbnailer
pkgver=1.0
pkgrel=1
pkgdesc="Tool to display thumbnails for OpenEXR images in your file manager."
arch=('any')
url="https://github.com/yama-chan/openexr-thumbnailer"
license=('GPL')
depends=('gnome-common' 'glib2' 'gdk-pixbuf2' 'openexr')
makedepends=()
checkdepends=()
provides=($pkgname=$pkgver)
source=("$pkgname::git+https://github.com/yama-chan/$pkgname.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
