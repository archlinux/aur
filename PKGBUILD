# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato

pkgname=typstudio-bin
pkgver=0.1.0dev.22
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
	webkit2gtk)
makedepends=()
provides=("typstudio=$pkgver")
conflicts=(typstudio)
source=("$pkgname-$pkgver.deb::https://github.com/Cubxity/typstudio/releases/download/v${_pkgver}/typstudio_0.1.0_amd64.deb")
sha256sums=('e4770477c00df1262339b1aa75ed2048b77d42e0d8a591af037f44213e0cef57')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
}
