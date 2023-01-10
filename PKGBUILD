# Maintainer: weilinfox <weilinfox at yzzi dot icu>

pkgname=thlink-client-gtk
pkgver=0.0.10
pkgrel=1
pkgdesc="Touhou Project Game Netplay Tool (client)"
arch=('x86_64' 'aarch64')
url="https://github.com/weilinfox/youmu-thlink/"
license=('AGPL3')
depends=('hicolor-icon-theme' 'gtk3' 'glib2' 'cairo')
makedepends=('go' 'gtk3' 'glib2' 'cairo' 'atk')
source=("https://github.com/weilinfox/youmu-thlink/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("cf9b74f54d2b8237295e2b056d16c1ec")

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

