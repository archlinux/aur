# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=2.0.0.rc3
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('i686' 'x86_64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/2.0.0-rc3/INAV-Configurator_linux64_2.0.0-rc3.zip
        inav-configurator.desktop
        inav_icon_128.png)

md5sums_x86_64=('ce02eaa8bbb88a581d3ea8cb35cfd6ce'
         'a84590640d45f59f9710480a9ac78a84'
         '2c94429c7b2fc0cc78ead5d840f3dd57')

source_i686=(https://github.com/iNavFlight/inav-configurator/releases/download/2.0.0-rc3/INAV-Configurator_linux32_2.0.0-rc3.zip
        inav-configurator.desktop
        inav_icon_128.png)

md5sums_i686=('3326f7c7904d65a3bc6b79b2b07df362'
         'a84590640d45f59f9710480a9ac78a84'
         '2c94429c7b2fc0cc78ead5d840f3dd57')

provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL3')

package() {
	mkdir -p "$pkgdir/opt/inav"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"
	cp -dpr --no-preserve=ownership "$srcdir/INAV Configurator" "$pkgdir/opt/inav/inav-configurator"
	install -Dm644 "$srcdir/inav_icon_128.png" "$pkgdir/opt/inav/inav-configurator/icon/inav_icon_128.png"
	chmod +x "$pkgdir/opt/inav/inav-configurator/inav-configurator"
	ln -s "$pkgdir/opt/inav/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"
}