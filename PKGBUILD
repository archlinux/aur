# Maintainer: seja-arcticfox <seja.czstudio@gmail.com>
pkgname=vidcom
pkgver=0.83
pkgrel=1
pkgdesc="Archive your videos"
arch=('x86_64')
url="https://github.com/seja-arctic-fox/vidcom"
license=('GPL-3.0-only')
depends=('gtkmm-4.0' 'libadwaita' 'jsoncpp' 'ffmpeg')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/seja-arctic-fox/vidcom/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5fc0bd87ed7b7e4760225fe7f9a35bc6bf58e6f05b6aa9a58038a9509bc7198')

build() {
	cd "$pkgname-$pkgver"
	meson setup build --prefix=/usr
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
}
