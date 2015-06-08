# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=dmagick
pkgver=6.9.0
pkgrel=1
pkgdesc="D wrapper for ImageMagick"
arch=("i686" "x86_64")
url="https://github.com/MikeWey/DMagick"
license=('unknown')
depends=("dmd" "dtools" "imagemagick")
source=("https://github.com/MikeWey/DMagick/archive/ImageMagick_$pkgver.tar.gz")
md5sums=("31e73ba27cb4505e76d4a67fcef56e5f")

build() {
	cd "DMagick-ImageMagick_$pkgver"
	sed -i "s/prefix=.*/prefix=\\/usr/" GNUmakefile
	make
}

package() {
	cd "DMagick-ImageMagick_$pkgver"
	make DESTDIR="$pkgdir/" install
}
