# Maintainer: Jari Ahola <aphototool@ahola.me>
pkgname=aphototoollibre
pkgver=1.0.2
pkgrel=1
pkgdesc="Photo editor for Linux"
arch=('x86_64')
url="https://www.ahola.me/aphototoollibre.html"
license=('GPL3')
depends=('qt5-base>=5.15.2' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver-$pkgrel-src.tar.gz::https://github.com/aphototool/A-Photo-Tool-Libre/archive/refs/tags/v$pkgver-$pkgrel.tar.gz"
	"$pkgname-$pkgver-$pkgrel-src.tar.gz.asc::https://github.com/aphototool/A-Photo-Tool-Libre/releases/download/v$pkgver-$pkgrel/v$pkgver-$pkgrel.tar.gz.asc")
sha256sums=('2197498de0059392a62621f7c7e696d0d54bb57779b82e442d6ba89849e12c73' 'SKIP')
validpgpkeys=('A970F7E40CB64F0D5B9FC516AFE56C2DF614820C')

build() {
	cd "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel"
	qmake
	make
}

package() {
	cd "$srcdir/A-Photo-Tool-Libre-$pkgver-$pkgrel"
	install -Dm755 "bin/aphototoollibre" "$pkgdir/usr/bin/aphototoollibre"
	install -Dm644 "debian/aphototoollibre.1.gz" "$pkgdir/usr/share/man/man1/aphototoollibre.1.gz"
	install -Dm644 "desktop/me.ahola.aphototoollibre.desktop" "$pkgdir/usr/share/applications/me.ahola.aphototoollibre.desktop"
	install -Dm644 "desktop/me.ahola.aphototoollibre.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/me.ahola.aphototoollibre.svg"
	install -Dm644 "desktop/me.ahola.aphototoollibre.metainfo.xml" "$pkgdir/usr/share/metainfo/me.ahola.aphototoollibre.metainfo.xml"
}

