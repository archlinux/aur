# Maintainer: Alban Fichet <alban.fichet@inria.fr>
pkgname=gthumb-openexr-extension
pkgver=2.0
pkgrel=4
pkgdesc="Extension for gThumb to support OpenEXR"
arch=('any')
url="https://github.com/yama-chan/gthumb-openexr-extension"
license=('GPL')
depends=('gthumb>=3.4' 'glib2' 'gtk3' 'gconf' 'openexr')
makedepends=('git' 'meson')
checkdepends=()
provides=($pkgname=$pkgver)
source=("$pkgname::git+https://github.com/yama-chan/$pkgname.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	meson --prefix=/usr build
	cd build
	ninja
}

package() {
	cd "$pkgname"
	cd build
	ninja install
}
