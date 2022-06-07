# Maintainer: Tomoghno Sen <sentomoghno503@gmail.com>

pkgname=elementary-iridium
pkgver=1.9.0
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
sha256sums=('12c151947c0d66277bcdc1d4790da213efc32f1060186d8a6195a5bfa8294038')

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
