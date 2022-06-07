# Maintainer: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=appcenter
pkgver=3.10.0
pkgrel=1
pkgdesc="Browse and manage apps"
arch=('x86_64')
url="https://github.com/elementary/appcenter"
license=('GPL3')
depends=('granite' 'libhandy' 'packagekit' 'appstream' 'flatpak')
makedepends=('meson' 'vala')
provides=('io.elementary.appcenter')
conflicts=('io.elementary.appcenter')
source=("appcenter-$pkgver.tar.gz::https://github.com/elementary/appcenter/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9978f4684df9dd9a11378576d51667eb60e9addd53d54adb9762827e4b44324f')

build() {
	arch-meson appcenter-$pkgver build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
