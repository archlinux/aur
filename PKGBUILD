# Maintainer: weilinfox <weilinfox at yzzi dot icu>

pkgname=thlink-client-gtk
pkgver=0.0.8
pkgrel=1
pkgdesc="Touhou Project Game Netplay Tool (client)"
arch=('x86_64' 'aarch64')
url="https://github.com/weilinfox/youmu-thlink/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'gtk3' 'glib2' 'cairo')
makedepends=('go' 'gtk3' 'glib2' 'cairo' 'atk')
source=("https://github.com/weilinfox/youmu-thlink/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("a1d0918f5c4de2341bf4b369bf2961f6")

build() {
	cd "youmu-thlink-$pkgver"

	go build -o ./build/thlink-client-gtk ./client-gtk3/
}

package() {
	cd "youmu-thlink-$pkgver"

	install -Dm755 ./build/thlink-client-gtk $pkgdir/usr/bin/thlink-client-gtk
	install -Dm755 ./thlink-client-gtk.desktop $pkgdir/usr/share/applications/thlink-client-gtk.desktop
	install -Dm644 ./thlink-client-gtk.png $pkgdir/usr/share/icons/hicolor/32x32/apps/thlink-client-gtk.png
}

