# Maintainer: Tomoghno Sen <sentomoghno503@gmail.com>

pkgname=elementary-iridium
pkgver=1.7.0
pkgrel=2
pkgdesc="Friendly IRC Client"
arch=('x86_64')
url="https://appcenter.elementary.io/com.github.avojak.iridium/"
license=('GPL3')
depends=('granite' 'libhandy' 'libsoup')
makedepends=('meson' 'vala')
provides=('com.github.avojak.iridium')
conflicts=('com.github.avojak.iridium')
source=("iridium-$pkgver.tar.gz::https://github.com/avojak/iridium/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('078ec146a8a077f306e1d8740e5f2efe5dda225c70cbfcd0149a6b13c9d10390')

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
