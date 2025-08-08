# Maintainer: CluelessCatBurger <cluelesscatburger@gmail.com>
pkgname=wl_shimeji-plugin-kwinsupport
pkgver=0.0.1
pkgrel=1
pkgdesc="Plugin for wl_shimeji that enables window interaction when running under kwin_wayland"
arch=('x86_64')
url="https://github.com/CluelessCatBurger/wl_shimeji.kwinsupport"
license=('GPL-2.0')
depends=('wl_shimeji-git' 'libsystemd')
makedepends=('git' 'uthash')
source=("$pkgname::git+https://github.com/CluelessCatBurger/wl_shimeji.kwinsupport.git")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 "$srcdir/$pkgname/build/plugins/libkwinsupport.so" "$pkgdir/usr/lib/wl_shimeji/libkwinsupport.so"
}
