# Maintainer: Anna Schumaker <anna@nowheycreamery.com>
pkgname=ocarina
pkgver=6.5.1
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
sha1sums=('52d4bd595b50be5ddea7828f29274cfb0fc2326e')

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
