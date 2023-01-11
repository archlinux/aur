# Maintainer: itsme <mymail@ishere.ru>

pkgname=swaylock-effects
pkgver=1.6.4
_pkgver=1.6-4
pkgrel=1
pkgdesc="A fancier screen locker for Wayland."
arch=('i686' 'x86_64')
url="https://github.com/mortie/$pkgname"
license=('MIT')
depends=('libxkbcommon' 'cairo' 'gdk-pixbuf2' 'pam')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland' 'wayland-protocols')
provides=('swaylock' 'swaylock-effects')
conflicts=('swaylock' 'swaylock-effects-git')
source=("https://github.com/mortie/$pkgname/archive/v$_pkgver.tar.gz")
sha256sums=('4f82c9d875ce20f1d58227ef65db60aacccb3fb29ce67c0f744849da68e82b20')

build() {
	cd "$pkgname-$_pkgver"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$pkgname-$_pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
