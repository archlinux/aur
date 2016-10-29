# Maintainer: Anna Schumaker <anna@nowheycreamery.com>
pkgname=ocarina
pkgver=6.5
pkgrel=1
pkgdesc="A simple GTK+ and GStreamer based music player."
url="http://www.nowheycreamery.com/"
arch=('x86_64' 'i686' 'armv7h')
license=('GPL2')
depends=('gtkmm3>=3.16' 'gstreamer' 'gst-plugins-base' 'taglib' 'libmusicbrainz5' 'libcoverart')
optdepends=('gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
source=("http://nowheycreamery.com/wp-content/ocarina/${pkgname}-${pkgver}.tar.gz")
sha1sums=('4a842619d7405e59aaedbd62539b1651fe186485')

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
