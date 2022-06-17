# Maintainer: Tim Cassels <cassels2025@gmail.com>

pkgname=flnet
pkgver=7.5.0
pkgrel=1
pkgdesc="voice net controller database / check-in application"
arch=("x86_64")
url="http://www.w1hkj.com/"
license=("gpl")
depends=("fltk" "glibc" "libx11" "gcc-libs" "libxrender" "libxcursor" "libxfixes" "libxext" "libxft" "fontconfig" "libxinerama" "libxcb" "freetype2" "expat" "libxau" "libxdmcp" "zlib" "bzip2" "libpng" "harfbuzz" "glib2" "graphite" "pcre")
optdepends=()
source=("https://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("8b8fcf9ce076553c10b730dff628ad30f93f2605bcf0660e2a13d9cada0b2de7")

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
