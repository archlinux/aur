
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theweb
pkgver=16.0
pkgrel=0
pkgdesc="Web Browser based on QtWebEngine"
arch=("x86_64")
url="https://github.com/vicr123/theweb"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'the-libs' 'qt5-webengine')
makedepends=('git' 'nodejs' 'npm')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theweb#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	node buildtool.js
}

package() {
	cd "$pkgname-$pkgver"/build
	make install INSTALL_ROOT=$pkgdir
}
