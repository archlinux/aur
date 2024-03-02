# Contributor: senft <senftt@gmail.com>

_pkgname=en-croissant

pkgname="${_pkgname}"-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A Modern Chess Database"
arch=('x86_64')
url="https://github.com/franciscoBSalgueiro/en-croissant"
license=('GPL-3.0')
depends=('hicolor-icon-theme' openssl-1.1
	pango
	webkit2gtk
	gtk3
	libsoup
	glib2
	cairo
	gcc-libs
	gdk-pixbuf2
	glibc
)

source_x86_64=("https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('1199cafb2e76c275755352bd6deea807a8a0d0ca9028803ab96ba1b0981e5aac')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir
	find $pkgdir -name "*.desktop" -exec sed -i "s/Exec=.*/Exec=GDK_BACKEND=x11 en-croissant/g" {} \;
}
