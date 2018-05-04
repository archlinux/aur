# Maintainer: Silvan <silvan@smallpdf.com>
# Contributor: Max <max@smallpdf.com>

pkgname=smallpdf-desktop
pkgver=1.9.1
pkgrel=1
pkgdesc='Smallpdf desktop reader and converter'
arch=(x86_64)
url='https://smallpdf.com/'
license=('custom')
depends=('gconf' 'gtk3' 'cairo' 'pango' 'dbus' 'xorg-server'
		 'c-ares' 'ffmpeg' 'http-parser' 'libevent' 'libxss'
		 'minizip' 'nss' 're2')
makedepends=()
provides=('smallpdf-desktop')
conflicts=('smallpdf-desktop')
install='smallpdf-desktop.install'
source=('https://download.smallpdf.com/desktop/linux/package-linux.tar.gz'
        'smallpdf-desktop.desktop'
        'smallpdf')
sha256sums=('bc50e95da1ada3495f59dc6c7d824a6ca6f446c24271a081b3b8d45cf1fda163'
            'a56b2da40fec921ee2cbad55c3767fdba20af8055082c611a4ce2ab29fed3096'
            '9d3719ee5bf53a6bab73886ade14253a2055ba312804625354a8009509900050')

package() {
	install -dm755 ${pkgdir}/opt/smallpdf-desktop
	install -dm755 ${pkgdir}/usr/bin

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -m755 ${srcdir}/smallpdf ${pkgdir}/usr/bin
	cp -r ${srcdir}/web/desktop/build/packages/Smallpdf-linux-x64/* ${pkgdir}/opt/smallpdf-desktop
}
