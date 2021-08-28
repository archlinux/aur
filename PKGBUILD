# Maintainer: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=elementary-mixer
pkgver=0.1.3
pkgrel=1
pkgdesc="Change the volume of apps"
arch=('x86_64')
url="https://appcenter.elementary.io/com.github.childishgiant.mixer/"
license=('GPL3')
depends=('granite' 'libhandy')
makedepends=('meson' 'vala')
provides=('com.github.childishgiant.mixer')
conflicts=('com.github.childishgiant.mixer')
source=("mixer-$pkgver.tar.gz::https://github.com/ChildishGiant/mixer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4131df912f141b60911e6f571bab6871c4ba9b49003c0532a77a57de9a818ed2')

build() {
	arch-meson mixer-$pkgver build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
