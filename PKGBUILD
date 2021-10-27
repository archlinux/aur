# Maintainer: Alban Fichet <alban.fichet@inria.fr>
pkgname=gthumb-openexr-extension
pkgver=3.12.0
pkgrel=13
pkgdesc="Extension for gThumb to support OpenEXR"
arch=('any')
url="https://github.com/afichet/gthumb-openexr-extension"
license=('GPL')
depends=('git' 'gthumb>=3.12' 'glib2' 'gtk3' 'gconf' 'openexr')
makedepends=('git' 'gnome-common' 'cmake')
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
