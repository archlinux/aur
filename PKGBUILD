# Maintainer: Anna Schumaker <anna@nowheycreamery.com>
pkgname=ocarina
pkgver=6.5.2
pkgrel=1
pkgdesc="A simple GTK+ and GStreamer based music player."
url="http://www.nowheycreamery.com/"
arch=('x86_64' 'i686' 'armv7h')
license=('GPL2')
depends=('gtk3>=3.22' 'gstreamer' 'gst-plugins-base' 'taglib' 'libmusicbrainz5' 'libcoverart')
optdepends=('gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
source=("http://nowheycreamery.com/wp-content/ocarina/${pkgname}-${pkgver}.tar.gz")
sha1sums=('f55c835d9c4d95122e6f0c3d0a222f73121b8dc5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake .
	make $MAKEFLAGS
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr
	cp -r bin/ share/ ${pkgdir}/usr/
}
