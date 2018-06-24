# Maintainer: Tim Cassels <cassels2025@gmail.com>

pkgname=flwrap
pkgver=1.3.5
pkgrel=1
pkgdesc="file encapsulation / compression for fldigi"
arch=("x86_64")
url="http://www.w1hkj.com/"
license=("gpl")
depends=("fltk" "gcc-libs" "glibc" "libxrender" "libxcursor" "libxext" "libxft" "fontconfig" "libxinerama" "libx11" "freetype2" "expat" "libxcb" "zlib" "bzip2" "libpng" "harfbuzz" "libxau" "libxdmcp" "glib2" "graphite" "pcre")
optdepends=()
source=("http://www.w1hkj.com/files/flwrap/$pkgname-$pkgver.tar.gz")
md5sums=("31354a76aa3b95684e26769d78c2a430")

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	./configure
	make
	install -Dm755 src/$pkgname "${pkgdir}/usr/bin/$pkgname"
	install -Dm644 data/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm644 data/$pkgname.xpm "${pkgdir}/usr/share/icons/$pkgname.xpm"
}
