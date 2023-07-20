# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=zeppplayer
pkgver=1.6.9
pkgrel=1
pkgdesc="Unofficial ZeppOS emulator"
arch=(any)
url="https://melianmiko.ru/en/zeppplayer"
license=('GPLv3')
depends=(python python-gobject libappindicator-gtk3 gtk3 tk bluez python-pillow python-requests python-six)
makedepends=(make python-pip python nodejs npm esbuild)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/ZeppPlayer.git")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/"
	npm ci
	make
}

package() {
	cd "$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir"
}

