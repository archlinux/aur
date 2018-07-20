# Maintainer: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
pkgver=0.5.5
pkgrel=1
pkgdesc="Games manager/downloader/library written in Vala for Elementary OS that supports GOG and Steam"
arch=('any')
url="https://github.com/tkashkin/GameHub"
license=('unknown')
depends=('granite' 'gtk3' 'glibc' 'webkit2gtk' 'json-glib' 'libgee' 'libsoup' 'sqlite' 'gdk-pixbuf2' 'cairo')
makedepends=('meson' 'ninja' 'vala')
conflicts=('gamehub-git')
source=("GameHub-$pkgver.tar.gz"::https://github.com/tkashkin/GameHub/archive/0.5.5.tar.gz)
md5sums=('0020379a2a52a39118a7932cb127b7b5') 

build() {
	cd "GameHub-$pkgver"
	meson build --prefix=/usr -Ddistro=arch
	cd build
	ninja
}

package() {
	cd "GameHub-$pkgver"/build
	sudo ninja install
}
