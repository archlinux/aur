# Maintainer: Denis Benato <benato.denis96@gmail.com>
pkgname=inputplumber
_pkgbase=inputplumber
pkgver=0.35.4
pkgrel=1
pkgdesc="Open source input router and remapper daemon for Linux"
arch=('x86_64')
options=(!lto)
url="https://github.com/ShadowBlip/InputPlumber"
license=('GPL')
depends=('dbus' 'libevdev' 'libiio')
makedepends=('rust' 'make' 'cmake' 'clang')
provides=('inputplumber')
conflicts=('inputplumber-bin' 'inputplumber-git')
source=("InputPlumber-$pkgver.tar.gz::https://github.com/ShadowBlip/InputPlumber/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cce52a9ed156936aac3835ea864af96c18b4fc87c840a59a9226671fecf6352e')

prepare() {
	cd "$srcdir/InputPlumber-$pkgver"
}

build() {
	cd "$srcdir/InputPlumber-$pkgver"
	make build
}

package() {
	cd "$srcdir/InputPlumber-$pkgver"
	make install PREFIX=${pkgdir}/usr NO_RELOAD=true
}
