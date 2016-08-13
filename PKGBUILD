# Maintainer: Anna Schumaker <anna@ocarinaproject.net>
pkgname=ocarina
pkgver=6.4.17
pkgrel=1
pkgdesc="A simple GTK+ and gstreamer based music player."
url="http://www.ocarinaproject.net/"
arch=('x86_64' 'i686' 'armv7h')
license=('GPL2')
depends=('gtkmm3>=3.16' 'gstreamer' 'gst-plugins-base' 'taglib' 'libmusicbrainz5' 'libcoverart')
optdepends=('gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('scons')
conflicts=()
replaces=()
backup=()
source=("http://ocarinaproject.net/wp-content/ocarina/${pkgname}-${pkgver}.tar.gz")
sha1sums=('dfd5e1e68f0860158fa7d4b4aff3c9840b4f5ff3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	scons $MAKEFLAGS
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr
	cp -r bin/ share/ ${pkgdir}/usr/
}
