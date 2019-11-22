# Maintainer: Alban Fichet <alban.fichet@inria.fr>
pkgname=gthumb-openexr-extension
pkgver=1.1
pkgrel=2
pkgdesc="Extension for gThumb to support OpenEXR"
arch=('any')
url="https://github.com/yama-chan/gthumb-openexr-extension"
license=('GPL')
depends=('gthumb>=3.4' 'glib2' 'gnome-common' 'gtk3' 'gconf' 'openexr')
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
