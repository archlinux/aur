# Contributor: Asuka Minato
pkgname=rustytube-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="A rusty Youtube client"
arch=(x86_64)
url="https://github.com/opensourcecheemsburgers/RustyTube"
license=('AGPL3') # I am not sure
depends=(webkit2gtk
	gcc-libs
	libsoup
	gdk-pixbuf2
	glib2
	glibc
	hicolor-icon-theme
	cairo
	gtk3
)
provides=(rustytube)
conflicts=(rustytube)
source=(
	"https://github.com/opensourcecheemsburgers/RustyTube/releases/download/v${pkgver}/rustytube_v${pkgver}_amd64.deb")
sha256sums=('aa22a5290d6cdb486e6c3f12ad82594f54012df339e9ba9d447e61059528a46b')

package() {
	bsdtar -xf data.tar.* -C $pkgdir
	chmod -R 755 $pkgdir/usr
	find $pkgdir -type d -empty -delete
}
