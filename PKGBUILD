# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=ecmerge-bin
pkgver=2.5.205
pkgrel=2
pkgdesc='Compares and merges text files, images, binaries and folders visually'
arch=('x86_64')
url='https://www.elliecomputing.com/en/Products/merge_overview.asp'
license=('custom')
depends=(lib32-at-spi2-core lib32-brotli lib32-bzip2 lib32-cairo lib32-expat lib32-fontconfig lib32-freetype2 lib32-fribidi lib32-gcc-libs lib32-gdk-pixbuf2 lib32-glib2 lib32-glibc lib32-gtk2 lib32-harfbuzz lib32-libdatrie lib32-libffi lib32-libice lib32-libjpeg-turbo lib32-libpng lib32-libpng12 lib32-libsm lib32-libthai lib32-libtiff lib32-libx11 lib32-libxau lib32-libxcb lib32-libxcomposite lib32-libxcursor lib32-libxdamage lib32-libxdmcp lib32-libxext lib32-libxfixes lib32-libxi lib32-libxinerama lib32-libxrandr lib32-libxrender lib32-pango lib32-pcre2 lib32-pixman lib32-util-linux lib32-xz lib32-zlib lib32-zstd)
provides=("ecmerge=${pkgver}")
conflicts=('ecmerge')
source=("http://www.soft.elliecomputing.com/soft/ecmerge-$pkgver.linux.x86.tbz"
        "local://ecmerge.desktop")
sha256sums=('173ee0733bc50fbcf1c6743903629882984560d051420c3ff0217d74b7a37077'
            'SKIP')

package() {
	cp -r opt "$pkgdir/"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/elliecomputing/ecmerge/guimerge "$pkgdir/usr/bin/ecmerge"

	mkdir -p "$pkgdir/usr/share/applications"
	cp ecmerge.desktop "$pkgdir/usr/share/applications"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	ln -s /opt/elliecomputing/ecmerge/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
