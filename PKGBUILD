# Maintainer: Tim Cassels <cassels2025@gmail.com>

pkgname=flnet
pkgver=7.3.2
pkgrel=3
pkgdesc="voice net controller database / check-in application"
arch=("x86_64")
url="http://www.w1hkj.com/"
license=("gpl")
depends=("fltk" "glibc" "libx11" "gcc-libs" "libxrender" "libxcursor" "libxfixes" "libxext" "libxft" "fontconfig" "libxinerama" "libxcb" "freetype2" "expat" "libxau" "libxdmcp" "zlib" "bzip2" "libpng" "harfbuzz" "glib2" "graphite" "pcre")
optdepends=()
source=("https://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=("2b1df942ae1272cdb64f4ffbf8eda13a")

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	./configure
	make
	install -Dm755 src/$pkgname "${pkgdir}/usr/bin/$pkgname"
	install -Dm644 data/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
	install -Dm644 data/$pkgname.xpm "${pkgdir}/usr/share/icons/$pkgname.xpm"
}
