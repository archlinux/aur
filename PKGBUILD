# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=mtkimg
pkgver=r58.a92c609
pkgrel=1
pkgdesc="Unpack/Repack boot.img, recovery.img and logo.bin for Mediatek CPU based devices "
arch=('any')
url="https://github.com/rom1nux/mtkimg"
license=('GPL')
depends=('zlib' 'libpng' 'gzip' 'cpio')
makedepends=('git' )
source=("git+https://github.com/rom1nux/mtkimg.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/$pkgname"
	make
}

package() {
	cd "${srcdir}/$pkgname"
	install -Dm0755 ./build/mtkimg "${pkgdir}/usr/bin/mtkimg"
}
