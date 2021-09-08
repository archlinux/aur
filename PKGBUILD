# Maintainer: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=appcenter
pkgver=3.7.1
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
sha256sums=('0bc35a5f31f8de11dfc7f6b3cdb47d0358ed77a97ed50879c1793ca1820d31a9')

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
