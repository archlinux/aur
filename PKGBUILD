# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=foo-yc20
pkgver=1.3.0
pkgrel=1
pkgdesc="This is a Faust implementation of a 1969 designed Yamaha combo organ, the YC-20. Available on the web, as a VST and LV2 plugins and a standalone version."
arch=("x86_64" "i686")
url="https://github.com/sampov2/foo-yc20"
license=('BSD')
depends=(
	'atk'
	'cairo'
	'fontconfig'
	'freetype2'
	'gdk-pixbuf2'
	'graphite'
	'gtk2'
	'harfbuzz'
	'jack'
	'libdatrie'
	'libglvnd'
	'libpng'
	'libthai'
	'libx11'
	'libxau'
	'libxcb'
	'libxcomposite'
	'libxcursor'
	'libxdamage'
	'libxdmcp'
	'libxext'
	'libxfixes'
	'libxi'
	'libxinerama'
	'libxrandr'
	'libxrender'
	'pango'
	'pixman'
)
provides=('foo-yc20')
source=("https://github.com/sampov2/foo-yc20/archive/1.3.0.tar.gz")
md5sums=('c37dda7d5fee4a134f1ec7c5994c890f')



build() {
	cd "$pkgname-$pkgver"
	make $BUILD_FLAGS PREFIX="/usr"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
