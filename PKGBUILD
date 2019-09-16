# Maintainer: Sonny Piers <sonny@fastmail.net>
pkgname=tangram
pkgver=1.1.0
pkgrel=1
pkgdesc="Run web apps on your desktop"
arch=('any')
url="https://github.com/sonnyp/Tangram"
license=('GPL3')
depends=('gjs' 'webkit2gtk' 'gtk3' 'libsoup' 'glib2')
provides=('gigagram-git')
conflicts=('gigagram-git')
replaces=('gigagram-git')
makedepends=('meson' 'ninja')
source=("https://github.com/sonnyp/Tangram/archive/v$pkgver.tar.gz")
sha256sums=('6f53bb9864b610dd9d6c026500c2a9d8ed03d3ceb179d3dbf16faa74c7955820')

build() {
	arch-meson Tangram-$pkgver build
	ninja -C build
}

package(){
	DESTDIR="$pkgdir" ninja -C build install
}
