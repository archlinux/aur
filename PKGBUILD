# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Asuka Minato

pkgname=typstudio-bin
pkgver=0.1.0dev.23
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
sha256sums=('734f30f6fafd593d950fad17d94eff422740b42639d26fa86ca78d4a802a172e')

package() {
	tar -xvpf data.tar.* -C $pkgdir
	chown -R root:root $pkgdir/usr
}
