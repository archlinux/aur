# Maintainer: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=appcenter
pkgver=3.8.0
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
sha256sums=('14185c8954ce526e0522033811079ff0fcc446d39ef9413e1c18949722dde711')

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
