# Maintainer: basigur

pkgname=joxi
pkgver=3.0.9
pkgrel=5
pkgdesc="Free tool for screen capture"
arch=('x86_64')
url="http://joxi.net"
license=('custom')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base' 'qt5-script' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-quick1' 'libgl' 'libx11' 'libstdc++5' 'libxdamage' 'glib2' 'gtk2' 'libmcrypt' 'libcurl-compat' 'libappindicator-gtk2')
replaces=('joxi' 'joxi-lib')
conflicts=('joxi-lib')
source_x86_64=("http://dl.${pkgname}.ru/linux/${pkgname}-net_x86_64-fr.rpm")
sha512sums_x86_64=('89a545cea55b1b9afcd1dddd6fa82bf08188939e1fec97e7192b2fe1d4aa875112edd22848d9d22192f05bfe7e2db47af7c73c3e5ffb7cee81c2e625b88fd849')

package() {
  cd "$srcdir"

	cp -r usr $pkgdir
	sed -i 's!/opt/joxi/icon_64!joxi!' $pkgdir/usr/share/applications/Joxi.desktop
	sed -i 's!/usr/bin/joxi!joxi!' $pkgdir/usr/share/applications/Joxi.desktop

	install -D -m644 "${srcdir}/opt/${pkgname}/icon_64.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -D -m644 "${srcdir}/opt/${pkgname}/icon_light.png" "${pkgdir}/usr/share/pixmaps/${pkgname}_light.png"

}
