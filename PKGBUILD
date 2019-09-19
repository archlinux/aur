# Maintainer: Sonny Piers <sonny@fastmail.net>
pkgname=tangram
pkgver=1.2.0
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
sha256sums=('e3f7baae512ab355c817c9638e5b114306f635dd4cfc736f0fb0cfdb2012c7ee')

build() {
	arch-meson Tangram-$pkgver build
	ninja -C build
}

package(){
	DESTDIR="$pkgdir" ninja -C build install
}
