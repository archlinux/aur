# Maintainer: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=elementary-iridium
pkgver=1.3.2
pkgrel=1
pkgdesc="Friendly IRC Client"
arch=('x86_64')
url="https://appcenter.elementary.io/com.github.avojak.iridium/"
license=('GPL3')
depends=('granite' 'libhandy' 'libsoup')
makedepends=('meson' 'vala')
provides=('com.github.avojak.iridium')
conflicts=('com.github.avojak.iridium')
source=("iridium-$pkgver.tar.gz::https://github.com/avojak/iridium/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1cf7eb6405b55c639e878eaff1fc62325cdbc8a7e440a00fd4d7a53817f398a0')

build() {
	arch-meson iridium-$pkgver build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
