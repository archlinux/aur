# Maintainer: Alban Fichet <alban.fichet@inria.fr>
pkgname=gthumb-openexr-extension
pkgver=2.0
pkgrel=6
pkgdesc="Extension for gThumb to support OpenEXR"
arch=('any')
url="https://github.com/yama-chan/gthumb-openexr-extension"
license=('GPL')
depends=('git' 'meson' 'gthumb>=3.10' 'glib2' 'gtk3' 'gconf' 'openexr')
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
	meson --prefix /usr --buildtype=plain  build
	ninja -v -C build
}

package() {
	cd "$pkgname"
	ninja -C build install
}
