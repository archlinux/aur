# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato

pkgname=typstudio-bin
pkgver=0.1.0dev.32
_pkgver=${pkgver/dev/-dev}
pkgrel=1
pkgdesc='desktop application for typst'
url="https://github.com/Cubxity/${pkgname%-bin}"
arch=(x86_64)
license=(GPL3)
depends=(
	glibc
	hicolor-icon-theme
	gtk3
	glib2
	pango
	gdk-pixbuf2
	cairo
	gcc-libs
	webkit2gtk
	libsoup)
provides=("typstudio=$pkgver")
conflicts=(typstudio)
source=("$pkgname-$pkgver.deb::https://github.com/Cubxity/typstudio/releases/download/v${_pkgver}/typstudio_0.1.0_amd64.deb")
sha256sums=('d302d2e5c9b1644ca9d26b3fb3cb1d9e0da1264a2bb54eec746b5c87eb58f4a6')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
}
