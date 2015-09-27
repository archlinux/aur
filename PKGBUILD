# Maintainer: pezcurrel <pezcurrel [at] tiscali.it>
# Maintainer: <kontakt.zuf [at] gmail.com>
# Maintainer: Eric Bélanger <eric [at] archlinux.org>
# Maintainer: Lukas Jirkovsky <l.jirkovsky [at] gmail.com>

pkgname=geeqie-lirc
pkgver=1.1
pkgrel=3
pkgdesc="A lightweight image browser and viewer (fork of GQview) - with LIRC enabled"
arch=('i686' 'x86_64')
url="http://geeqie.sourceforge.net/"
license=('GPL3')
depends=('exiv2' 'gtk2' 'lcms' 'desktop-file-utils' 'lirc-utils')
makedepends=('git' 'intltool' 'doxygen' 'gnome-doc-utils')
optdepends=('librsvg: SVG rendering')
replaces=('gqview' 'gqview-devel')
conflicts=('geeqie' 'geeqie-git')
provides=('geeqie')
install=geeqie.install
source=( "http://downloads.sourceforge.net/project/geeqie/geeqie/geeqie-1.1/geeqie-1.1.tar.gz" )
md5sums=( 'e63351988625c84b0fd80bc4eefd923b' )

build() {
	cd "${srcdir}/geeqie-1.1"
	CPPFLAGS="-D_FILE_OFFSET_BITS=64" ./configure --prefix=/usr --enable-lirc
	make
}

package(){
	cd "$srcdir/geeqie-1.1"
	install -d -m755 "${pkgdir}/usr/share/doc/geeqie-1.1/html"
	make DESTDIR="${pkgdir}" install
}
