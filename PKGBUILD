# Maintainer: Robert Stoffers <rstoffers@gmail.com>

pkgname=gamehub
pkgver=0.5.5
pkgrel=2
pkgdesc="Games manager/downloader/library written in Vala for Elementary OS that supports GOG and Steam"
arch=('any')
url="https://github.com/tkashkin/GameHub"
license=('unknown')
depends=('granite' 'gtk3' 'glibc' 'webkit2gtk' 'json-glib' 'libgee' 'libsoup' 'sqlite' 'gdk-pixbuf2' 'cairo')
makedepends=('meson' 'ninja' 'vala')
conflicts=('gamehub-git')
source=("GameHub-$pkgver.tar.gz"::https://github.com/tkashkin/GameHub/archive/0.5.5.tar.gz)
md5sums=('8dbc4437ccdb2e73da6d4e11c900325a') 

build() {
	cd "GameHub-$pkgver"
	meson build --prefix=$pkgdir/usr -Ddistro=arch
	cd build
	ninja
}

package() {
	cd "GameHub-$pkgver"/build
	sudo ninja install
}
