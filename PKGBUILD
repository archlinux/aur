# Maintainer: Alban Fichet <alban.fichet@inria.fr>
pkgname=openexr-thumbnailer
pkgver=1.1
pkgrel=6
pkgdesc="Tool to display thumbnails for OpenEXR images in your file manager."
arch=('any')
url="https://github.com/afichet/openexr-thumbnailer"
license=('GPL')
depends=('gnome-common' 'glib2' 'gdk-pixbuf2' 'openexr')
makedepends=('cmake' 'git')
checkdepends=()
provides=($pkgname=$pkgver)
source=("$pkgname::git+https://github.com/afichet/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
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
