# Maintainer: r e r n <rernrern@gmail.com>

pkgname=mpd_oled
pkgver=0.02
pkgrel=1
pkgdesc='OLED Spectrum Display for Raspberry Pi'
url=https://github.com/antiprism/mpd_oled
arch=(i686 x86_64 arm armv7h armv6h aarch64)
license=(MIT)
depends=(alsa-lib fftw i2c-tools)
makedepends=(gcc glibc libtool)
source=("${url}/archive/refs/heads/master.zip")
sha256sums=(SKIP)

build() {
	cd "${srcdir}/${pkgname}-master"
	./bootstrap
	CPPFLAGS="-W -Wall -Wno-psabi"
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname}-master"
	make DESTDIR="${pkgdir}" install
}
