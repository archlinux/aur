# Maintainer: Jari Ahola <aphototool@ahola.me>
pkgname=aphototoollibre
pkgver=1.0.1
pkgrel=2
pkgdesc="Photo editor for Linux"
arch=('x86_64')
url="https://www.ahola.me/aphototoollibre.html"
license=('GPL3')
depends=('qt5-base>=5.15.2' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver-$pkgrel-src.tar.gz::https://github.com/aphototool/A-Photo-Tool-Libre/archive/refs/tags/v$pkgver-$pkgrel.tar.gz"
	"$pkgname-$pkgver-$pkgrel-src.tar.gz.asc::https://github.com/aphototool/A-Photo-Tool-Libre/releases/download/v$pkgver-$pkgrel/v$pkgver-$pkgrel.tar.gz.asc")
sha256sums=('42f22e1c294c89704cd564365b2519981ef02f3c9b95f176c6d243fd6c420d98' 'SKIP')
validpgpkeys=('A970F7E40CB64F0D5B9FC516AFE56C2DF614820C')

build() {
	cd "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel"
	qmake
	make
}

package() {
	cd "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	mkdir -p "$pkgdir/usr/share/metainfo"
	cp "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel/bin/APhotoToolLibre" "$pkgdir/usr/bin/"
	cp "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel/desktop/me.ahola.aphototoollibre.desktop" "$pkgdir/usr/share/applications/"
	cp "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel/desktop/me.ahola.APhotoToolLibre.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	cp "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel/desktop/me.ahola.aphototoollibre.metainfo.xml" "$pkgdir/usr/share/metainfo/"
}
