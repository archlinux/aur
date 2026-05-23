# Maintainer: seja-arcticfox <seja.czstudio@gmail.com>
pkgname=vidcom
pkgver=0.82
pkgrel=1
pkgdesc="Archive your videos"
arch=('x86_64')
url="https://github.com/seja-arctic-fox/vidcom"
license=('GPL-3.0-only')
depends=('gtkmm-4.0' 'libadwaita' 'jsoncpp' 'ffmpeg')
makedepends=('meson' 'ninja')
changelog="https://github.com/seja-arctic-fox/vidcom/releases/tag/v0.82"
source=("$pkgname-$pkgver.tar.gz::https://github.com/seja-arctic-fox/vidcom/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4dd2fc558b0ff34507a59431bbb3bd94a2f6749b9bf41693c3d278a2624e6bd')

build() {
	cd "$pkgname-$pkgver"
	meson setup build --prefix=/usr
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
}
