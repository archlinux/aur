# Maintainer: Tim Cassels <cassels2025@gmail.com>

pkgname=flwrap
pkgver=1.3.6
pkgrel=1
pkgdesc="file encapsulation / compression for fldigi"
arch=("x86_64")
url="http://www.w1hkj.com/"
license=("gpl")
depends=("fltk" "gcc-libs" "glibc" "libxrender" "libxcursor" "libxext" "libxft" "fontconfig" "libxinerama" "libx11" "freetype2" "expat" "libxcb" "zlib" "bzip2" "libpng" "harfbuzz" "libxau" "libxdmcp" "glib2" "graphite" "pcre")
optdepends=()
source=("http://www.w1hkj.com/files/flwrap/$pkgname-$pkgver.tar.gz")
sha1sums=("392bc28de4b03ecb53d0aacc3f01522853e1d9f5")

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	install -Dm755 src/$pkgname "${pkgdir}/usr/bin/$pkgname"
	install -Dm644 data/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm644 data/$pkgname.xpm "${pkgdir}/usr/share/icons/$pkgname.xpm"
}
