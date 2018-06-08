# Maintainer: Silvan <silvan@smallpdf.com>
# Contributor: Max <max@smallpdf.com>

pkgname=smallpdf-desktop
pkgver=1.11.1
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
sha256sums=('014221742a0c5fa280c2cf1627fe501986761fb7e7b06446f0c78b1086249433'
            'a56b2da40fec921ee2cbad55c3767fdba20af8055082c611a4ce2ab29fed3096'
            '08adf2892165a22a9ce06f16d04b4190e4a54ef46da20702e3b73cad18424133')

package() {
	install -dm755 ${pkgdir}/opt/smallpdf-desktop
	install -dm755 ${pkgdir}/usr/bin

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -m755 ${srcdir}/smallpdf ${pkgdir}/usr/bin
	cp -r ${srcdir}/web/desktop/build/packages/Smallpdf-linux-x64/* ${pkgdir}/opt/smallpdf-desktop
}
