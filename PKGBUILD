# Maintainer: Erik Johnson <palehose at gmail dot com>
pkgname=mikogo
pkgver=4.5.120116
_release=4.5
pkgrel=2
pkgdesc='Mikogo screen-sharing server'
url=http://www.mikogo.com
arch=(i686 x86_64)
license=(unknown)
if [ "$CARCH" = "x86_64" ]; then
	depends=(lib32-dbus-core lib32-fontconfig lib32-gcc-libs lib32-glib2 lib32-glibc lib32-pcre lib32-libsm lib32-libxrender lib32-libxtst)
else
	depends=(dbus-core fontconfig gcc-libs glib2 glibc pcre libsm libxrender libxtst)
fi
options=(!strip)
source=(http://download.mikogo4.com/mikogo.tar.gz)
md5sums=(c524c07c5b633da170b9f2d1d0ce4437)

package() {
	mkdir -p -m 0755 ${pkgdir}/usr/bin
	install -m 0755 ${srcdir}/${pkgname}${_release}/mikogo ${pkgdir}/usr/bin/
	install -m 0755 ${srcdir}/${pkgname}${_release}/sessionplayer ${pkgdir}/usr/bin/
}
