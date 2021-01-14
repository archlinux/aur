# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.0.5
pkgrel=1
pkgdesc="Call audio routing daemon"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.com/mobian1/callaudiod"
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
sha256sums=('0016a5800749d408dbaa14d8a7886bf492068d56508c83a352dee9b1920754b4')

build() {
	arch-meson callaudiod-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
