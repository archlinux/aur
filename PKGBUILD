# Maintainer: itsme <mymail@ishere.ru>

pkgname=swaylock-effects
pkgver=1.7.0.0
pkgrel=1
pkgdesc="A fancier screen locker for Wayland."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/mortie/$pkgname"
license=('MIT')
depends=('libxkbcommon' 'cairo' 'gdk-pixbuf2' 'pam')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland' 'wayland-protocols')
provides=('swaylock')
source=("https://github.com/jirutka/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e94d79e189602694bedfbafb553ce3c6c976426e16f76d93bf7e226dc2876eb6')

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
