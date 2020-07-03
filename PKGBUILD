# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=stitch-gear360-git
pkgver=r3.f2c2941
pkgrel=1
pkgdesc="Stitching tool for 360° videos captured by the Samsung Gear 360 (SM-C200)"
arch=('any')
url='https://github.com/bilde2910/stitch-gear360'
license=('MIT')
depends=('fisheye-stitcher' 'fisheye-mls-map-3840x1920' 'python-spatialmedia' 'ffmpeg' 'ncurses')
makedepends=('git')
provides=('stitch-gear360')
conflicts=('stitch-gear360')
source=("git+https://github.com/bilde2910/stitch-gear360.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/stitch-gear360"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/stitch-gear360"
	install -Dm755 stitch-gear360.sh "$pkgdir/usr/bin/stitch-gear360"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/stitch-gear360/LICENSE"
}
